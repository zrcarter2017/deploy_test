#AUTHOR: TAYLOR F. TURNER
from decimal import *
from datetime import timedelta
from datetime import datetime
import pandas as pd
import pandas.util.testing as tm
import dateutil.relativedelta

def days_to_eoq(date):
  if date.month == 1: 
    days = 60 + 30 - (date.day)
  if date.month == 2: 
    days = 30 + 30 - (date.day)
  if date.month == 3: 
    days = 30 - (date.day)
  if date.month == 4: 
    days = 60 + 30 - (date.day)
  if date.month == 5: 
    days = 30 + 30 - (date.day)
  if date.month == 6: 
    days = 30 - (date.day)
  if date.month == 7: 
    days = 60 + 30 - (date.day)
  if date.month == 8: 
    days = 30 + 30 - (date.day)
  if date.month == 9: 
    days = 30 - (date.day)
  if date.month == 10:
    days = 60 + 30 - (date.day)
  if date.month == 11: 
    days = 30 + 30 - (date.day)
  if date.month == 12: 
    days = 30 - (date.day)
  return days + 1


def pandas_subquery(data_frame, note_idz_out):
    '''subset data frame for note_idz that are not in the 
    distribution table'''
    data = data_frame.loc[data_frame['id'].isin(note_idz_out)]
    return data


def out_search(searchdict, sourcedict, out_search_list):
  ''' this searches for concat(investor_id,'_',note_type) 
  from the notes table and determines what notes are NOT 
  in the distributnions table already'''
  for k in sourcedict:
    if k not in searchdict:
        out_search_list.append(k)


def noteid_to_list(data_frame_column, append_to):
    '''convert sql column query of note_idz 
    to their own lists'''
    for k in data_frame_column:
  k = int(k)
  append_to.append(k)

def data_column_names(data_frame):
    '''renames the columns names of 
    the mysql fetchall() 
    to a consistent name set'''

    old_names = []

    for column in data_frame:
        old_names.append(column)

    new_col_names = ['note_type', 'invest_date', 'id', 'interest_rate', 'dollar_investment', 'quarter_count']
    data_frame.rename(columns=dict(zip(old_names,new_col_names)), inplace=True)
    
    return data_frame

def dist_column_name(data_frame):
    '''renames the columns names of 
    the mysql fetchall() 
    to a consistent name set'''

    old_names = []

    for column in data_frame:
        old_names.append(column)

    new_col_names = ['note_id']
    data_frame.rename(columns=dict(zip(old_names,new_col_names)), inplace=True)
    
    return data_frame


def master_for_loop(data_frame, note_type_append, date_append, id_append, iter_append, dollar_append, interest_rate_append, day_append):
    """
    master for loop to create
    pandas data frame that has repeating id with each quarter 
    number for each investment along with a dynamic calculation of 
    how many days their investment was "active" with REVA Funding, LLC 
    in the first quarter 
    """
    for i in data_frame['id']: 
        for j in range(int(data_frame.loc[data_frame['id'] == i, 'quarter_count'].iloc[0])):
            id_append.append(str(i))
            date_append.append(data_frame.loc[data_frame['id'] == i, 'invest_date'].iloc[0])
            note_type_append.append(data_frame.loc[data_frame['id'] == i, 'note_type'].iloc[0])
            iter_append.append(j)
            dollar_append.append(float(data_frame.loc[data_frame['id'] == i, 'dollar_investment'].iloc[0]))
            interest_rate_append.append(float(data_frame.loc[data_frame['id'] == i, 'interest_rate'].iloc[0]))
            if j == 0:
                tmp_date = data_frame.loc[data_frame['id'] == i, 'invest_date'].iloc[0]
                calc_num = days_to_eoq(tmp_date)
                day_append.append(calc_num)
            else: 
                day_append.append(90)

def calc_true_distribution_date(append_to, bgn_date, cum_sum_days_num):
    """
        calc the true distribution date for each quarterly distribution 
        to REVA Funding, LLC investors.
    """
    for date in bgn_date:
        for day_num in cum_sum_days_num[0]:
            day = date + timedelta(days = int(str(day_num)))
      var = day.day - 15
            if day_num >= 60 and day_num < 90:
                data_point = date + timedelta(days = int(str(day_num))) - timedelta(days = int(str(var))) + dateutil.relativedelta.relativedelta(months=1)
                append_to.append(data_point)
            elif day_num >= 90:
                data_point = date + timedelta(days = int(str(day_num))) - timedelta(days = int(str(var))) + dateutil.relativedelta.relativedelta(months=2)
                append_to.append(data_point)
      elif day_num < 60 and day_num > 30: 
    data_point = date + timedelta(days = int(str(day_num))) - timedelta(days = int(str(var))) + dateutil.relativedelta.relativedelta(months=2)
    append_to.append(data_point)
      elif day_num < 30:
    data_point = date + timedelta(days = int(str(day_num))) - timedelta(days = int(str(var))) + dateutil.relativedelta.relativedelta(months=0)

def insert_dist_data(con, cursor, ziplist):
    """
    insert distributnion data to mysql
    database on allegiancy.us domain webserver
    """
    for row in ziplist:
        """
        originally with the id field in the table this is the sql insert statement
        insert_stmt = ("INSERT INTO dist (id, note_id, quart_num, dist_date, cum_sum_days, quart_days, dollar, interest_rate, distribution) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)")
        """
        insert_stmt = ("INSERT INTO `distributions` (note_id, quart_num, dist_date, cum_sum_days, quart_days, dollar, interest_rate, distribution, paid, created_at, updated_at) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, 'NO', NOW(), NOW())")
        cursor.execute(insert_stmt, row)
        con.commit()


def pre_insert_sqlexecute(cursor):
    """
    check to ensure that the table exists in the database
    """
    # investor_dist
    cursor.execute("""CREATE TABLE IF NOT EXISTS `distributions` (
          `note_id` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
          `quart_num` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
          `dist_date` Date,
          `cum_sum_days` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
          `quart_days` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
          `dollar` double DEFAULT NULL,
          `interest_rate` double DEFAULT NULL,
          `distribution` double DEFAULT NULL,
          `paid` varchar(255) DEFAULT NULL,
          `updated_at` DateTime DEFAULT NOW(),
          `created_at` DateTime DEFAULT NOW()
        ) ENGINE=MyISAM DEFAULT CHARSET=utf8""")


def distribution_calc_append(append_to, dollar_invested, interest_rate, quarter_days, quarter_id):
    """
    for loop to calculate the 
    distribution amount for the respective
    investor and note type
    """
    for x in range(len(quarter_id)):
        append_to.append(((float(dollar_invested[x]) * interest_rate[x])/360) * float(quarter_days[x]))


def cum_sum_pandas(pandas, append_to_cum_sum, rec_id, rec_type, rec_days):
    tmp = pandas.DataFrame()
    tmp['id'] = rec_id
    tmp['note_type'] = rec_type
    tmp['days'] = rec_days
    tmp['cum_sum'] = tmp.groupby(['id', 'note_type'])['days'].apply(lambda x: x.cumsum())
    append_to_cum_sum.append(tmp['cum_sum'].tolist())


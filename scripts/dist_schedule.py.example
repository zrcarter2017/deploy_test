# AUTHOR: TAYLOR F. TURNER
import distribution 
import mysql.connector
import pandas as pd
import datetime
from datetime import timedelta
import pandas.util.testing as tm

"""
mysql connection
"""

# mysql connection to localhost
mysqlDB = mysql.connector.connect(host = 'localhost', user='root', password = 'password', database='production')


# pull data from note table
cursor = mysqlDB.cursor()
cursor.execute("""SELECT
	`notes`.`note_type` AS `note_type`,
	`notes`.`invest_date` AS `invest_date`,
	concat(`notes`.`investor_id`,'_',`notes`.`note_type`) AS `id`,
	`notetypes`.`note_interest_rate` AS `interest_rate`,
	`notes`.`dollar_invest` AS `dollar_investment`,
	(`notes`.`note_type` * 4) AS `quarter_count` FROM (`notes` left join `notetypes` on((`notes`.`note_type` = `notetypes`.`note_type`))) """)  # execute sql query
data = pd.DataFrame(cursor.fetchall()) # fetch the data
data = distribution.data_column_names(data)


# pull current unique note_id
cursor.execute("""SELECT DISTINCT 
	`distributions`.`note_id` AS `note_id` 
	FROM distributions""") #sql query of current distributions in database
dist = pd.DataFrame(cursor.fetchall())
dist = distribution.dist_column_name(dist)


"""
list definition for FOR loop 
"""
dist_id_table = []#note_idz that are current in the dist table
note_id_table = []#note_idz that are currently in the note table
note_id_out = [] #note_idz not in the distribution table but are in notes table
cum_sum_days = []
cum_sum_id = []
note_type = [] # note type list 
dist_date = [] # true distribution date for quarterly distributnion based on 360 year basis
invest_date = [] # list to hold the date invested
quart_id = [] # list to hold ids from for loop
quart_dollar = [] # list of dollar amount investment
quart_iter = [] # list to hold quarter id from for loop
quart_days = [] # list to hold investor's total days of investment in the quarter -- for calculating the interest payable to the investor
quart_interest_rate = [] # list of interest rates for the respective id
quart_dist = [] # list of distributnion payments


#convert distinct note and distributnion table note_idz to dict
distribution.noteid_to_list(data['id'],note_id_table)
distribution.noteid_to_list(dist['note_id'], dist_id_table)


#determine which note_idz are not in the distribution table
distribution.out_search(dist_id_table, note_id_table, note_id_out)

#subset data set for note_id that is not in the distribution table
data = distribution.pandas_subquery(data, note_id_out)

""" 
master for loop to create
pandas data frame that has repeating id with each quarter 
number for each investment along with a dynamic calculation of 
how many days their investment was "active" with REVA Funding, LLC 
in the first quarter 
"""
distribution.master_for_loop(data, note_type, invest_date, quart_id, quart_iter, quart_dollar, quart_interest_rate, quart_days)


"""
calculate distribution for 
ziplist mysql insert 
"""
distribution.distribution_calc_append(quart_dist, quart_dollar, quart_interest_rate, quart_days, quart_iter)


"""
if exists drop table and then create table
"""
distribution.pre_insert_sqlexecute(cursor)


"""
create pandas data frame 
and cumulative sum the days per quarter.
this is to calculate the distribution date 
for each investor
"""
distribution.cum_sum_pandas(pd, cum_sum_days, quart_id, note_type, quart_days)


"""
calc distribution amounts and submit data to mysql table
"""
x = enumerate(range(1, int(len(quart_id))), 1)
for i in x: 
	cum_sum_id.append(i[0])
now = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')

distribution.calc_true_distribution_date(dist_date, invest_date, cum_sum_days)

""" originall this is the ziplist code to submit data to the database ziplist = zip(cum_sum_id, quart_id, quart_iter, dist_date, cum_sum_days[0], quart_days, quart_dollar, quart_interest_rate, quart_dist)"""
ziplist = zip(quart_id, quart_iter, dist_date, cum_sum_days[0], quart_days, quart_dollar, quart_interest_rate, quart_dist)
distribution.insert_dist_data(mysqlDB, cursor, ziplist)


"""
close mysql connection
"""
mysqlDB.close()
Print("Script_complete_connection_closed")


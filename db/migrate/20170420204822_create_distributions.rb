class CreateDistributions < ActiveRecord::Migration[5.0]
  def change
    create_table :distributions do |t|
      t.string :note_id
      t.string :quart_num
      t.date :dist_date
      t.string :cum_sum_days
      t.string :quart_days
      t.float :dollar
      t.float :interest_rate
      t.float :distribution
      t.string :paid

      t.timestamps
    end
  end
end

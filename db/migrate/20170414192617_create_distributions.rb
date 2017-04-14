class CreateDistributions < ActiveRecord::Migration[5.0]
  def change
    create_table :distributions do |t|
      t.string :note_id
      t.string :quart_num
      t.string :dist_date
      t.string :cum_sum_days
      t.string :quart_days
      t.string :dollar
      t.string :interest_rate
      t.string :distribution
      t.string :paid

      t.timestamps
    end
  end
end

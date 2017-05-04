class CreateCriteria < ActiveRecord::Migration[5.0]
  def change
    create_table :criteria do |t|
      t.string :entity_name
      t.string :last_name
      t.string :first_name
      t.string :invest_date
      t.string :email
      t.string :note_type
      t.string :dollar_invest
      t.string :NOTIFY_DATE

      t.timestamps
    end
  end
end

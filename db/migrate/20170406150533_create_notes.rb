class CreateNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :notes do |t|
      t.string :investor_id
      t.string :invest_date
      t.string :note_type
      t.string :dollar_invest

      t.timestamps
    end
  end
end

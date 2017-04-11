class CreateNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :notes do |t|
      t.references :investor, foreign_key: true
      t.date :invest_date
      t.integer :note_type
      t.integer :dollar_invest

      t.timestamps
    end
  end
end

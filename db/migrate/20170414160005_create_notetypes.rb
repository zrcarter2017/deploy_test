class CreateNotetypes < ActiveRecord::Migration[5.0]
  def change
    create_table :notetypes do |t|
      t.string :note_type
      t.string :note_program
      t.string :note_interest_rate

      t.timestamps
    end
  end
end

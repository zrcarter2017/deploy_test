class ChangeDataTypeForNotesNoteType < ActiveRecord::Migration[5.0]
  def change
  	change_table :tablename :note_type :double
  end
end

class ChangeDataTypeForNotesNoteType < ActiveRecord::Migration[5.0]
  def change
  	change_column :notes, :note_type, :double
  end
end

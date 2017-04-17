class NoteIdToNoteTable < ActiveRecord::Migration[5.0]
  def change
  	add_column :note_id, :string
  end
end

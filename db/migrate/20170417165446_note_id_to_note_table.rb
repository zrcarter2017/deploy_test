class NoteIdToNoteTable < ActiveRecord::Migration[5.0]
  def change
  	add_column :notes, :note_id, :string
  end
end

class Note < ApplicationRecord
  
  # before :save, :set_note_id

  belongs_to :investor

  # def set_note_id
  # 	note_id = "#{investor_id}_#{note_type}"
  # end

end

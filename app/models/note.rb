class Note < ApplicationRecord

  belongs_to :investor

	# def create_note_id
	#   "#{self.id},#{self.investor_id}_#{self.note_type}"
	# end

end
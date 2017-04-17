class Note < ApplicationRecord

  belongs_to :investor

	def note_id
	  "#{self.address_1}, #{self.address_2}, #{self.city}"
	end

end
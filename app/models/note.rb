class Note < ApplicationRecord

  belongs_to :investor
	
 #  before_save :note_id

 #  def note_id
	# self.note_id = [:investor_id].to_s.concat('_').concat([:invest_date].to_s).concat('_').concat([:note_type].to_s)
 #  end

end
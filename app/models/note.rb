class Note < ApplicationRecord

  belongs_to :investor
	
  before_save :note_id

  def note_id
  	[investor_id, invest_date, note_type].join('_')
  end
  
end
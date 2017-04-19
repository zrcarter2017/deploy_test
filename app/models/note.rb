class Note < ApplicationRecord

  belongs_to :investor
	
  before_save :note_id

  def note_id
	self.note_id = (params[:investor_id].to_s).concat('_').concat(params[:invest_date].to_s).concat('_').concat(params[:note_type].to_s)
  end

end
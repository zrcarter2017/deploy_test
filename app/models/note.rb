class Note < ApplicationRecord

  belongs_to :investor
  # has_many :distributions


  def self.note_id
    @tmp_investor_id = params[:investor_id]

    @tmp_invest_date = params[:invest_date]

    @tmp_note_type = params[:note_type]

    @note_id = [@tmp_investor_id, @tmp_invest_date, @tmp_note_type].join('_')
   end 

end
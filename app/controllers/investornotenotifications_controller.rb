class InvestornotenotificationsController < ApplicationController
  
  before_filter :authorize

  # GET /notes
  # GET /notes.json
  def index
    @criterias = Investornotenotification.all
  end

end

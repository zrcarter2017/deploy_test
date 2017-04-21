class CriteriasController < ApplicationController
  
  before_filter :authorize

  # GET /notes
  # GET /notes.json
  def index
    @criterias = Criteria.all
  end

end

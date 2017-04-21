class CriteriasController < ApplicationController
  
  def index
    @criterias = Criteria.all
  end

end

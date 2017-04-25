 class NotifyController < ApplicationController
    
    def index
      @notify_investors = Report::Notify
      respond_to do |format|
        format.html {}
      end
    end

  end
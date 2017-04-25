  class NotifyController < ApplicationController
    
    def index
      @notifications = Report::Notify.where
      respond_to do |format|
        format.html {}
      end
    end

  end
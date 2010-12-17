class InsightController < ApplicationController
  
  before_filter :login_required
  
  def current_user
    @insight_user ||= login_from_multipass
  end
  
  def current_user=(multipass)
    session[:multipass] = multipass
    @insight_user       = login_from_multipass
  end
  
  def authorized?
    logged_in?
  end
  
  def logged_in?
    !!current_user
  end
  
  protected
  
    def login_required
      authorized?
    end
    
    def login_from_multipass
      session[:multipass].nil? ? nil : InsightUser.new(session[:multipass])
    end
  
end
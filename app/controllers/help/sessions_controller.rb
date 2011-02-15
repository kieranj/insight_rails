class Help::SessionsController < ApplicationController
  
  layout Insight.configuration.layout
  
  skip_before_filter :login_required
      
  protected
  
    def check_existing_login
      if logged_in?
        session[:multipass] = current_user.multipass
        redirect_to("/help")
      else
        redirect_to(login_path(:to => "/help"))
      end
    end
  
end
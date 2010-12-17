class Help::SessionsController < ApplicationController
  
  layout Insight.configuration.layout
  
  skip_before_filter :login_required
  
  before_filter :check_existing_login, :only => [ :new ]
  
  # def new    
  # end
  # 
  # def create
  #   json         = { :username => params[:username], :password => params[:password] }.to_json
  #   auth_details = MultiPass.encode64(json)
  #   
  #   session = InsightSession.new(:auth => auth_details)
  #   if session.save
  #     self.current_user = session.multipass
  #   else
  #     render :action => "new"
  #   end
  # end
  
  def destroy
    session[:multipass] = nil
    redirect_to("/help")
  end
  
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
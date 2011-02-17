class Help::SessionsController < ApplicationController
  
  layout Insight.configuration.layout
  
  skip_before_filter :login_required
  
end
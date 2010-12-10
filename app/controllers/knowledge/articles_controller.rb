class Knowledge::ArticlesController < ApplicationController
  
  skip_before_filter :login_required
  
  layout Insight.configuration.layout
  
  def show
    @article = Article.find(params[:id])
  end
  
end
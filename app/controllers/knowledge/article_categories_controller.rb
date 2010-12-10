class Knowledge::ArticleCategoriesController < ApplicationController
  
  skip_before_filter :login_required
  
  layout Insight.configuration.layout

  def index
    @categories = ArticleCategory.find(:all)
  end
  
end
class Knowledge::ArticleCategoriesController < ApplicationController
  
  skip_before_filter :login_required
  
  layout Insight.configuration.layout

  def index
    @categories      = ArticleCategory.find(:all)
    @latest_articles = Article.get(:latest)
    @latest_issues   = Issue.get(:latest)
  end
  
end
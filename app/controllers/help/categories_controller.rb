class Help::CategoriesController < InsightController
  
  skip_before_filter :login_required
  
  layout Insight.configuration.layout
  
  def index
    @categories = Category.find(:all)
  end
  
end
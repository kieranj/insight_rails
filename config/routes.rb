ActionController::Routing::Routes.draw do |map|
  
  map.knowledge "/knowledge",
    :controller => "knowledge/article_categories",
    :action     => "index"
    
  map.namespace :knowledge do |kb|
    kb.resources :categories, :controller => "article_categories"
    kb.resources :articles,   :only       => [ :index, :show ]
  end
  
  map.help "/help",
    :controller => "help",
    :action     => "index"
    
  map.namespace :help do |help|
    help.browse "/browse",
      :controller => "categories",
      :action     => "index"
  
    help.resources :categories do |category|
      category.resources :issues
    end
  
    help.resources :issues, :except => [ :destroy ] do |issue|
      issue.resources :comments, :except => [ :destroy ]
    end
  end
  
end
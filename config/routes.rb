Rails.application.routes.draw do
  
  match "/knowledge" => "knowledge/article_categories#index", :as => "knowledge"
  
  namespace :knowledge do
    resources :categories, :controller => "article_categories"
    resources :articles,   :only       => [ :index, :show ]
  end  
  
  match "/help"  => "help#index", :as => "help"
  
  namespace :help do |help|

    match "/browse" => "categories#index", :as => "browse"
  
    resources :categories do
      resources :issues
    end
  
    resources :issues, :except => [ :destroy ] do
      get :my, :on => :collection
      resources :comments, :except => [ :destroy ]
    end
  end
  
end
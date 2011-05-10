Redditclone::Application.routes.draw do
  
  resources :sites

  get "homepage/index"
  
  # get 'link/new', :as => 'new_link'
  resources :link

  devise_for :users

  root :to => "homepage#index"

end

Redditclone::Application.routes.draw do

  resources :sites

  get "homepage/index"
  
  resources :links
  # get 'links/new', :as => 'new_link'
  # get 'links/index', :as => 'links'
  # post 'links'

  devise_for :users

  root :to => "homepage#index"

end

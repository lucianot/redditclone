Redditclone::Application.routes.draw do

  get "homepage/index"
  
  resources :links, :only => [:new, :create]

  devise_for :users
  
  root :to => "homepage#index"

end

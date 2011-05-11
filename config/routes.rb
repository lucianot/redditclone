Redditclone::Application.routes.draw do

  get "homepage/index"
  
  resources :links, :only => [:index, :new, :create]

  devise_for :users
  
  root :to => "links#index"

end

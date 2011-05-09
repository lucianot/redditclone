Redditclone::Application.routes.draw do
  
  resources :sites

  get "homepage/index"

  devise_for :users

  root :to => "homepage#index"

end

Redditclone::Application.routes.draw do
  
  get "homepage/index"

  devise_for :users

  root :to => "homepage#index"

end

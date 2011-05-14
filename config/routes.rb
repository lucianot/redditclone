Redditclone::Application.routes.draw do

  resources :links, :only => [:index, :new, :create]

  devise_for :users
  
  root :to => "links#index"

end

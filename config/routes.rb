Redditclone::Application.routes.draw do

  resources :links, :only => [ :index, :new, :create ] do
    post 'upvote', :on => :member
  end
  
  resources :votes, :only => [ :index, :destroy ]
  
  # resources :votes do
  #   get 'up', :on => :member
  # end

  devise_for :users
  
  root :to => "links#index"

end

Redditclone::Application.routes.draw do

  resources :links, :only => [ :index, :new, :create ] do
    post 'upvote', :on => :member
    post 'downvote', :on => :member
    post 'remove_vote', :on => :member
  end
  
  resources :votes, :only => [ :index, :destroy ]

  devise_for :users
  
  root :to => "links#index"

end

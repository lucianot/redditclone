Redditclone::Application.routes.draw do

  resources :links, :only => [ :index, :new, :create ] do
    post 'vote/:value' => 'votes#create', :as => 'vote'
    delete 'votes' => 'votes#destroy', :as => 'remove_vote'
  end
  
  resources :votes, :only => [ :index, :destroy ]

  devise_for :users
  
  root :to => "links#index"

end

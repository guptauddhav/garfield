Rails.application.routes.draw do
  devise_for :users
  get 'tags/:tag', to: 'tags#show', as: :tag
  get 'tags', to: 'tags#index'
  resources :pins do
  	member do 
  		put "like", to: "pins#upvote"
  	end
  end
  resources :vendors do
    resources :reviews, except: [:show, :index, :edit]
  	member do 
  		put "like", to: "vendors#upvote"
  	end
  end
  root "pins#index" 

end

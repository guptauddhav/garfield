Rails.application.routes.draw do
  
  devise_for :users
  root "pins#index"
  get 'tags/:tag', to: 'tags#show', as: :tag
  get 'tags', to: 'tags#index'
  get 'reviews/:id', to: 'reviews#show', as: :review
  get 'comments/:id', to: 'comments#show', as: :comment
  get '/search', to: 'search#results'

  resources :pins do
    resources :comments, except: [:show, :index, :edit]
  	member do 
  		put "like", to: "pins#upvote"
  	end
  end
  resources :vendors do
    resources :reviews, except: [:index, :edit]
  	member do 
  		put "like", to: "vendors#upvote"
  	end
  end

  resources :incidents do
    resources :comments, except: [:show, :index, :edit]
    resources :pictures, except: [:index, :edit]
  end

end

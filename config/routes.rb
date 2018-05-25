Rails.application.routes.draw do

  root to: 'users#top'

  resources :blogs

  resources :blogs do
    collection do
      post :confirm
    end
    resources :comments
  end

  resources :sakes

  resources :sakes do
    collection do
      post :confirm
    end
  end

  resources :favorites, only: [:create, :destroy]

  resources :sessions, only: [:new, :create, :destroy]

  resources :users, only: [:new, :show, :create]

end

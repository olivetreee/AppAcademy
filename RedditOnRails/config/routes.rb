Rails.application.routes.draw do

  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]
  resources :subs do
    resources :posts, except: [:index]
  end

  resources :posts, only: [] do
    resources :comments
  end

end

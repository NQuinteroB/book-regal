Rails.application.routes.draw do

  # get 'users/show'
  # get 'users/edit'
  # get 'users/destroy'
  devise_for :users
  root to: "pages#home"
  # Users routes
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :books do
review-controller
    resources :reviews, only: %i[index new create]
  end

  resources :reviews, only: %i[show destroy]
    resources :bookings, only: %i[index new create]
  end

  resources :bookings, only: %i[show destroy]
master
end

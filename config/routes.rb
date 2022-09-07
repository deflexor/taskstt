Rails.application.routes.draw do
  resources :tasks
  devise_for :users
  resources :tasks do
    post 'start', on: :member
    post 'approve', on: :member
    post 'cancel', on: :member
    post 'complete', on: :member
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root "tasks#index"
end

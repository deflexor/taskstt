Rails.application.routes.draw do
  devise_for :users
  resources :tasks
  resources :tasks do
    post 'start', on: :member
    post 'approve', on: :member
    post 'cancel', on: :member
    post 'complete', on: :member
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get 'profile', to: 'users#show'
  get 'api/tasks_by_status/:status', to: 'tasks#list_by_status'


  # Defines the root path route ("/")
   root "tasks#index"
end

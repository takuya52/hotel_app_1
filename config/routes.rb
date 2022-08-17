Rails.application.routes.draw do
  get 'reservations/index'
  get 'reservations/new'
  get 'reservations/show'
  get 'rooms/index'
  get 'users/profile'
  get 'users/update'
  


  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  
  root 'home#index'
  get 'home/index'

  resources :rooms do
    collection do
      get 'search'
    end
  end

  resources :reservations


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

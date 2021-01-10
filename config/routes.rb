Rails.application.routes.draw do
  devise_for :users
  devise_scope :users do
    get '/users', to: redirect("/users/sign_up")
  end
  get 'events/index'
  root to: 'events#index'
  resources :events
  post 'users/guest_sign_in', to: 'users#new_guest'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

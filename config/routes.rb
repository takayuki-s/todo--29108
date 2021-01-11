Rails.application.routes.draw do
  devise_for :users
  devise_scope :users do
    get '/users', to: redirect("/users/sign_up")
  end
  get 'events/index'
  root to: 'events#index'
  resources :events do
    member do
      put 'done'
    end
  end
  post 'users/guest_sign_in', to: 'users#new_guest'
  # put 'events/todo_done', to: 'events#done'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

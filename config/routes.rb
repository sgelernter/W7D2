Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resource :session, only: [:destroy, :new, :create]
  resources :bands
  resources :users, only: [:create, :new, :show]
end

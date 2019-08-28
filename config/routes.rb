Rails.application.routes.draw do
  get 'designers/index'
  get 'eventos/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :eventos
  resource :designers, only: [:index, :new, :create]
  root 'eventos#index'
end

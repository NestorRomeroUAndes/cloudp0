Rails.application.routes.draw do
  get 'eventos/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :eventos
  root 'eventos#index'
end

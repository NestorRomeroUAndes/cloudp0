require 'resque/server'

Rails.application.routes.draw do
  resources :proyectos do
    resource :designers, only: [:index, :new, :create]
  end
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users, only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  get 'designers/index'
  get 'eventos/index'
  get 'welcome/index'
  get 'welcome/vanity', to: "welcome#vanity"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :eventos

  root 'welcome#index'
  mount Resque::Server.new, at: "/resque"
end

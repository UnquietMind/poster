Rails.application.routes.draw do
  
  authenticated :user, -> user { user.admin? } do
    mount Delayed::Web::Engine, at: '/jobs'
  end
  
  get 'auth/:provider/callback', to: 'connections#create'
  resources :connections, only: [:destroy]
  get 'auth/failure', to: 'connections#omniauth_failure'

  devise_for :users, controllers: {registrations: 'registrations'}
  root 'pages#home'
  get 'dashboard', to: 'pages#dashboard'
  resources :posts
end

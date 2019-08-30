Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'articles#index'

  resources :articles do
    resources :comments, only: [:create, :destroy]
  end
  resources :users, only: :show

  namespace :api, format: 'json' do
    resources :articles, only: :index
  end
end

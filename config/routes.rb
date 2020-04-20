# frozen_string_literal: true

Rails.application.routes.draw do
  get 'attendances/event_schedule'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/profile', to: 'users#show'

  root 'static_pages#home'

  get '/events', to: 'events#show'
  get '/create', to: 'events#new'
  post '/create', to: 'events#create'
  get '/index', to: 'events#index'

  resources :events do
    member do
      post :schedule_event
      post :remove_event
    end
  end

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'


  resources :users
  resources :events
  resources :attendances , except: %i[create new]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

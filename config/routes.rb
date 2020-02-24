# frozen_string_literal: true

Rails.application.routes.draw do
  # get 'owners/index'
  # get 'owners/show'
  resources :owners, only: :show do
    collection do
      get 'search_results'
    end
  end

  # get 'vehicles/index'
  # get 'vehicles/show'
  resources 'vehicles', only: %i[index show]

  # get 'parking_tickets/index'
  # get 'parking_tickets/show'
  resources 'parking_tickets', only: %i[index show]

  # get 'pages/index'
  # get 'pages/show'
  resources :pages

  get ':permalink', to: 'pages#permalink', as: 'permalink'

  root 'owners#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

# frozen_string_literal: true

Rails.application.routes.draw do
  get 'parking_tickets/index'
  get 'parking_tickets/show'
  get 'vehicles/index'
  get 'vehicles/show'
  get 'owners/index'
  get 'owners/show'

  resources :owners, only: :show

  root 'owners#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

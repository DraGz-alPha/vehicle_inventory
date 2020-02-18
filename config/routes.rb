Rails.application.routes.draw do
  get 'parking_tickets/index'
  get 'parking_tickets/show'
  get 'vehicles/index'
  get 'vehicles/show'
  get 'owners/index'
  get 'owners/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

class Owner < ApplicationRecord
  has_many :vehicles
  has_many :parking_tickets
end

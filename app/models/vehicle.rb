class Vehicle < ApplicationRecord
  belongs_to :owner
  has_many :parking_tickets
end

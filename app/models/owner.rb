# frozen_string_literal: true

class Owner < ApplicationRecord
  has_many :vehicles
  has_many :parking_tickets

  validates :first_name, :last_name, :prefix, :age, presence: true
end

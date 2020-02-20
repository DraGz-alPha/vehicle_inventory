# frozen_string_literal: true

class Vehicle < ApplicationRecord
  belongs_to :owner
  has_many :parking_tickets

  validates :vin, uniqueness: true
  validates :vin, :make, :model, :color,
            :transmission_type, :year, :engine_size, :kilometrage,
            presence: true
end

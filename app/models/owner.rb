# frozen_string_literal: true

class Owner < ApplicationRecord
  has_many :vehicles
  has_many :parking_tickets

  validates :middle_name, uniqueness: true
  validates :prefix, :first_name, :middle_name, :last_name, :age, presence: true
end

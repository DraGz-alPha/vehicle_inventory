# frozen_string_literal: true

class ParkingTicket < ApplicationRecord
  belongs_to :owner
  belongs_to :vehicle

  validates :ticket_number, uniqueness: true
  validates :ticket_number, :violation, :street, :discounted_price,
            :full_price, :issue_date, presence: true
end

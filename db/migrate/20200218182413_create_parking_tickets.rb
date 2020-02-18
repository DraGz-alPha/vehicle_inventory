# frozen_string_literal: true

class CreateParkingTickets < ActiveRecord::Migration[6.0]
  def change
    create_table :parking_tickets do |t|
      t.string :ticket_number
      t.string :violation
      t.string :street
      t.string :latitude
      t.string :longitude
      t.decimal :discounted_price
      t.decimal :full_price
      t.datetime :issue_date

      t.timestamps
    end
  end
end

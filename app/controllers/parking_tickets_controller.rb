# frozen_string_literal: true

class ParkingTicketsController < ApplicationController
  def index
    @parking_tickets = ParkingTicket.all
  end

  def show
    @parking_ticket = ParkingTicket.find(params[:id])
  end
end

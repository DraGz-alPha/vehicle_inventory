# frozen_string_literal: true

class VehiclesController < ApplicationController
  def index
    @vehicles = Vehicle.all.order('year DESC')
  end

  def show
    @vehicle = Vehicle.includes(:parking_tickets).find(params[:id])
  end
end

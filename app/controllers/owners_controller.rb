# frozen_string_literal: true

class OwnersController < ApplicationController
  def index
    @owners = Owner.all
  end

  def show
    @owner = Owner.includes(:vehicles, :parking_tickets).find(params[:id])
  end
end

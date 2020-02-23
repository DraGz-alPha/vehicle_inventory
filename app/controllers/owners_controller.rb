# frozen_string_literal: true

class OwnersController < ApplicationController
  def index
    @owners = Owner.order(:last_name).page(params[:page])
  end

  def show
    @owner = Owner.includes(:vehicles, :parking_tickets).find(params[:id])
  end
end

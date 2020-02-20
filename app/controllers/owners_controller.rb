# frozen_string_literal: true

class OwnersController < ApplicationController
  def index
    @owners = Owner.all
  end

  def show
    # @owner = Owner.includes(:students, :teachers).find(params[:id])
    @owner = Owner.find(params[:id])
  end
end

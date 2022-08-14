class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.where(user_id: current_user.id)
  end

  def new
    @room = Room.find(params[:room_id])
    binding.pry
    @user_id = current_user.id
    binding.pry
    @reservation = Reservation.new
  end

  def show
  end
end

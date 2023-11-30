class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
    @rooms = Room.all
  end

  def new
    @user = current_user
    @reservation = Reservation.new
  end

  def create
    @room = Room.find(params[:reservation][:room_id])
    @reservation = Reservation.new(params.require(:reservation).permit(:start_date, :end_date, :people, :total, :user_id, :room_id))
    if @reservation.save
      redirect_to :reservations
    else
      redirect_to room_path(@room)
    end
  end 

  def confirm
    @reservation = Reservation.new(params.require(:reservation).permit(:start_date, :end_date, :people, :total, :user_id, :room_id))
    @room = Room.find(params[:reservation][:room_id])
    if @room.invalid? 
      redirect_to :rooms
    end
  end
end

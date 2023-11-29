class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
  end

  def create
    @reservation = Reservation.new(params.require(:reservation).permit(:start_date, :end_date, :people, :total, :user_id, :room_id))
    if @reservation.save
      redirect_to reservation_path
    else
      redirect_to room_path(@room)
  end

  def confirm
    @room = Room.find(params[:reservation][:room_id])
    if @room.invalid? 
      redirect_to :rooms 
    end
    @reservation = Reservation.new(params.require(:reservation).permit(:start_date, :end_date, :people, :total, :user_id, :room_id))
  end
end
end

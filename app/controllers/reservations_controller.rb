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
      @room = Room.find(params[:reservation][:room_id])
      redirect_to room_path(@room), alert: "予約できませんでした", status: :unprocessable_entity
    end
  end 

  def confirm
    @reservation = Reservation.new(params.require(:reservation).permit(:start_date, :end_date, :people, :total, :user_id, :room_id))
    unless
      @reservation.valid?
      @room = Room.find(params[:reservation][:room_id])
      render "rooms/show"
    end
  end
end

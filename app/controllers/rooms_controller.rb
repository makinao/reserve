class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(params.require(:room).permit(:name, :address, :content, :money, :home_image))
   if @room.save
      flash[:notice] = "施設を新規登録しました"
      redirect_to :rooms_index
   else
      flash[:notice] = "登録できませんでした"
      redirect_to :new_room
   end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end

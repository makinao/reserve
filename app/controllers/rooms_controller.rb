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
      flash[:success] = "施設を新規登録しました"
      redirect_to :rooms
   else
      flash.now[:failure] = "登録できませんでした"
      render "new", status: :unprocessable_entity
   end
  end

  def show
    @room = Room.find(params[:id])
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
     if @room.update(params.require(:room).permit(:name, :address, :content, :money, :home_image))
       flash[:success] = "ルームIDが「#{@room.id}」の情報を更新しました"
       redirect_to :rooms
     else
       flash.now[:failure] = "施設の更新に失敗しました。"
       render "edit", status: :unprocessable_entity
     end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    flash[:notice] = "予定を削除しました"
    redirect_to :rooms
  end

  def search
    @q = Room.ransack(params[:q])
    @rooms = @q.result(distinct: true)
  end

  def top
    @q = Room.ransack(params[:q])
    @rooms = @q.result(distinct: true)
  end
end
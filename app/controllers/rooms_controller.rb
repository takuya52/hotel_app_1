class RoomsController < ApplicationController
  def index
    @rooms = current_user.rooms.all
  end

  def new
    @room = current_user.rooms.new
  end

  def create
    @room = current_user.rooms.new(room_params)
    if @room.save
      flash[:notice] = "ルーム情報を登録しました"
      redirect_to :rooms
    else
      flash[:alert] = "ルーム情報を登録できませんでした"
      render "new"
    end
  end

  private

  def room_params
    params.require(:room).permit(:name, :introduction, :single_rate, :address, :image_name, :user_id)
  end


end

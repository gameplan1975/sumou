class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :edit, :update, :destroy]

  def index
    @rooms = Room.all
  end

  def show
    @stations = Station.all
  end

  def new
    @room = Room.new
    2.times{@room.stations.build}
  end

  def edit
    @room.stations.build
  end

  def create
    @room = Room.new(room_params)

    if @room.save
      redirect_to @room, notice: '物件情報が登録されました'
    else
      render :new
    end
  end

  def update
    if @room.update(room_params)
      redirect_to @room, notice: '物件情報が更新されました'
    else
      render :edit
    end
  end

  def destroy
    @room.destroy
    redirect_to rooms_url, notice: '物件情報を削除しました'
  end

  private
    def set_room
      @room = Room.find(params[:id])
    end

    def room_params
      params.require(:room).permit(:name, :rent, :address, :age, :comment,
      stations_attributes: [:line_name, :station_name, :walk_time])
    end
end

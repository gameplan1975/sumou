class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :edit, :update, :destroy]

  def index
    @rooms = Room.all
  end

  def show
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
    redirect_to rooms_url, notice: 'Room was successfully destroyed.'
  end

  private
    def set_room
      @room = Room.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def room_params
      params.require(:room).permit(:name, :rent, :address, :age, :comment)
    end
end

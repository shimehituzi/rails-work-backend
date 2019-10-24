class RoomsController < ApplicationController
  def index
    @rooms = Room.all
    render json: @rooms
  end

  def create
    @room = Room.create(room: room_params)
    render json: @room
  end

  def update
    @room = Room.find(params[:id])
    @room.update_attributes(room: room_params)
    render json: @room
  end

  def destroy
    @room = Room.find(params[:id])
    if @room.destroy
      head :no_content, status: :ok
    else
      render json: @room.errors, status: :unprocessable_entity
    end
  end

  private

  def room_params
    params.permit(:name)
  end
end

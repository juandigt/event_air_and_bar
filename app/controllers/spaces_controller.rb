class SpacesController < ApplicationController
  skip_before_action :authenticate_user!
  # Add exceptions to above line - Ie: ', only: :home'

  def index
    @spaces = Space.all
  end

  def show
    @space = Space.find(params[:id])
    @booking = Booking.new
  end

  def new
    @space = Space.new
  end

  def create
    @space = Space.new(space_params)
    @space.user = current_user
    if @space.save
      redirect_to space_path(@space)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def space_params
    params.require(:space).permit(:description, :name, :address, :capacity, :price, :photo, :user_id)
  end

end



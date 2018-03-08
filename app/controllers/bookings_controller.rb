class BookingsController < ApplicationController
  skip_before_action :authenticate_user!
  # Add exceptions to above line - Ie: ', only: :home'

  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @space = Space.find(params[:space_id])
    @booking = Booking.new
  end

  def create
    @space = Space.find(params[:space_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.status = 1
    @booking.space = @space
    if @booking.save(booking_params)
      redirect_to space_path(@space)
    else
      render :new
    end
  end

  def edit
    @booking = Booking.find(booking_params)
  end

  def update
    @booking = Booking.find(booking_params)
    @booking.update(booking_params)
    redirect_to bookings_path
  end

  def destroy
  end

  private

  def booking_params
    params.require(:booking).permit(:user_id, :space_id, :date, :status)
  end

end

class BookingsController < ApplicationController

  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save(booking_params)
      redirect_to bookings_path
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
    params.require(:booking)
  end

end

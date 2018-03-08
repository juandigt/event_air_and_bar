class SpacesController < ApplicationController
  skip_before_action :authenticate_user!
  # Add exceptions to above line - Ie: ', only: :home'

  def index
    if any_of_search_params_present?
      @spaces = filter_spaces
    else
      @spaces = Space.all
    end
  end

  def show
    @space = Space.find(params[:id])
    @booking = Booking.new
    if current_user
      @userbookings = @space.bookings.select { |b| b.user_id == current_user.id }.sort_by { |booking| booking.date}
    else
      @userbookings = []
    end
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
     @space = Space.find(params[:id])
  end

  def update
    @space = Space.find(params[:id])
    @space.update(space_params)
    redirect_to space_path(@space)
  end

  def destroy
    @space = Space.find(params[:id])
    @space.destroy
    redirect_to spaces_path
  end

  private

  def space_params
    params.require(:space).permit(:description, :name, :address, :capacity, :price, :photo, :user_id)
  end

  def any_of_search_params_present?
    params[:address].present? || params[:price].present? || params[:capacity].present?
  end

  def filter_spaces
    price = params[:price].present? ? params[:price] : Float::INFINITY
    capacity = params[:capacity].present? ? params[:capacity] : 100000
    Space.where("address ILIKE ?", "%#{params[:address]}%")
         .where("price <= ?", price)
         .where("capacity <= ?", capacity)
  end

end



class SpacesController < ApplicationController
  skip_before_action :authenticate_user!

  # Add exceptions to above line - Ie: ', only: :home'

  def index
     @spaces = policy_scope(Space).order(created_at: :desc)
    if any_of_search_params_present?
      @spaces = filter_spaces
    else
      @spaces = Space.all
    end
  end

  def show
    @space = Space.find(params[:id])
    @booking = Booking.new
    authorize @space
    if current_user
      @userbookings = @space.bookings.select { |b| b.user_id == current_user.id }.sort_by { |booking| booking.date}
    else
      @userbookings = []
    end
  end

  def new
    @space = Space.new
    authorize @space
  end

  def create
    @space = Space.new(space_params)
    @space.user = current_user
    authorize @space
    if @space.save
      redirect_to space_path(@space)
    else
      render :new
    end
  end

  def edit
     @space = Space.find(params[:id])
     authorize @space
  end

  def update
    @space = Space.find(params[:id])
    @space.update(space_params)
    redirect_to space_path(@space)
     authorize @space
  end

  def destroy
    @space = Space.find(params[:id])
    @space.destroy
    redirect_to dashboard_path
  end

  private

  def space_params
    params.require(:space).permit(:description, :name, :address, :capacity, :price, :photo, :user_id, :booking_id)
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



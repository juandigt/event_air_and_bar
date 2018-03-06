class SpacesController < ApplicationController

  def index
    @spaces = Space.all
  end

  def show
    @spaces = Space.find(params[:id])
  end

  def new
    @spaces = Space.new
  end

  def create
    @spaces = Space.new(spaces_params)
    space.save
    redirect_to space_path(@spaces)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def space_params
    params.require(:space).permit(:description)
  end

end



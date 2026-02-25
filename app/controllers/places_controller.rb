class PlacesController < ApplicationController
  # Show all places
  def index
    @places = Place.all
  end

  # Show the form to add a new place
  def new
    @place = Place.new
  end

  # Save a new place
  def create
    @place = Place.new(place_params)
    if @place.save
      redirect_to places_path   # Go back to index after saving
    else
      render :new               # Show form again if save fails
    end
  end

  private

  # Strong parameters — only allow :name
  def place_params
    params.require(:place).permit(:name)
  end
end
class FavoritesController < ApplicationController
  def index
  end

  def create
    trip = Trip.find(params[:trip_id])
    favorite = current_customer.favorites.new(trip_id: trip.id)
    favorite.save
    redirect_to trips_path(trip)
  end

  def destroy
    trip = Trip.find(params[:trip_id])
    favorite = current_customer.favorites.find_by(trip_id: trip.id)
    favorite.destroy
    redirect_to trips_path(trip)
  end
end

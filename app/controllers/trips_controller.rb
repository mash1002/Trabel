class TripsController < ApplicationController
  def index
    @trips = Trip.all
    @trips = @trips.where("address LIKE ?", "%#{params[:trip][:address]}%") if params[:trip] && params[:trip][:address].present?
  end

  def new
    @trip = Trip.new
  end
  
  def show
    @trip = Trip.find(params[:id])
    @comment = Comment.new
  end

  def create
    trip = Trip.new(trip_params)
    trip.save
     redirect_to '/trips'
  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def update
    @trip = Trip.find(params[:id])

      if @trip.update(trip_params)
      flash[:notice] = "変更しました"
      redirect_to trips_path

      else
      render :index
      end
  end

  def destroy
  end

  def search
  end

  private
  # ストロングパラメータ
  def trip_params
    params.require(:trip).permit(:image, :description, :address).merge(customer_id: current_customer.id)
  end
end

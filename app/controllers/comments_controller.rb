class CommentsController < ApplicationController



   def create
    trip = Trip.find(params[:trip_id])
    comment = current_customer.comments.new(comment_params)
    comment.trip_id = trip.id
    comment.save
    redirect_to trips_path(trip)
   end

   def destroy
      Comment.find(params[:id]).destroy
    redirect_to trips_path(params[:trip_id])
   end

   def index
      @trip = Trip.find(params[:trip_id])
      @comment = Comment.new
      @comments = @trip.comments

   end

   private

  def comment_params
    params.require(:comment).permit(:comment_text, :trip_id, :customer_id, :created_at, :updated_at)
  end
end

class CustomersController < ApplicationController

  def index
     @customer = Customer.all
  end

  def show
     @customer = Customer.find(params[:id])
     @trips = @customer.trips
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def favorites
    @customer = Customer.find(params[:id])
    @trips = @customer.favorite_trips

  end

  def search
    @model = params[:model]
		@content = params[:content]
		@method = params[:method]
		if @model == 'customer'
			@records = Customer.search_for(@content, @method)
		else
			@records = Trip.search_for(@content, @method)
		end
  end

  def create
    @customer = Customer.find(params[:id])
  end

  def update
     @customer = Customer.find(params[:id])

    if @customer.update(customers_params)
      flash[:notice] = "更新完了しました"
      redirect_to customer_path(@customer.id)

    else
      render :show
    end
  end

  def destroy
    trip = Trip.find(params[:id])
    trip.destroy
    redirect_to customer_path
  end

  private

  def customers_params
    params.require(:customer).permit(:email, :encrypted_password, :user_name, :self_introdaction, :icon_image, :reset_password_token, :reset_password_sent_at, :remember_created_at, :created_at, :updated_at)

  end
end

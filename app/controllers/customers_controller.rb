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
      redirect_to customers_path(@customer.id)

      else
      render :index
      end
  end

  def destroy
  end

  private

  def customers_params
    params.require(:customer).permit(:email, :encrypted_password, :user_name, :self_introdaction, :icon_image, :reset_password_token, :reset_password_sent_at, :remember_created_at, :created_at, :updated_at)

  end
end

class Customers::SessionsController < Devise::SessionsController
  def guest_sign_in
    customer = Customer.guest
    sign_in customer
    redirect_to trips_path, notice: 'ゲストユーザーとしてログインしました。'
  end

  def create
      customer = Customer.find_by(email: params[:customer][:email])
      if customer.active == false
        redirect_to root_path
        return
      end
     super
  end

  def destroy
    super
  end

end
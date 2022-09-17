class Customer::SessionsController < Devise::SessionsController
  def guest_sign_in
    customer = Customer.guest
    sign_in customer
    redirect_to trips_path, notice: 'ゲストユーザーとしてログインしました。'
  end
end
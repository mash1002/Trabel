class Customer::PasswordsController < Devise::PasswordsController
  before_action :ensure_normal_customer, only: :create

  def ensure_normal_user
    if params[:customer][:email].downcase == 'guest@example.com'
      redirect_to new_customer_session_path, alert: 'ゲストユーザーのパスワード再設定はできません。'
    end
  end
end
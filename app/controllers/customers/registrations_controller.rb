class Customers::RegistrationsController < Devise::RegistrationsController
  before_action :ensure_normal_customers, only: %i[update destroy]

  def ensure_normal_customer
    if resource.email == 'guest@example.com'
      redirect_to root_path, alert: 'ゲストユーザーの更新・削除はできません。'
    end
  end
end
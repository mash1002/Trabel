class AdminsController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @customers = Customer.all
  end

  def edit
    
  end
  
  def create
  end
  
  def update
  end
  
  def destroy
  end
end

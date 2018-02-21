class DashboardsController < ApplicationController
  skip_after_action :verify_authorized

  def dashboard
    if user_signed_in?
      @user = current_user
      @bookings = Booking.where(user: @user)
      @products = Product.where(user: @user)
    else
      redirect_to root_path
    end
  end
end

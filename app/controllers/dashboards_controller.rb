class DashboardsController < ApplicationController
  skip_after_action :verify_authorized
  def rental
    if user_signed_in?
      @user = current_user
      @bookings = Booking.where(user: @user)
    else
      redirect_to root_path
    end
  end

  def offer
    @user = current_user
    @products = Product.where(user: @user)

  end
end

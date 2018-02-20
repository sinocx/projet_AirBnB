class DashboardsController < ApplicationController
  def rental
    @user = current_user
    @bookings = Booking.where(user: @user)
    authorize @dashboard
  end

  def offer
    @user = current_user
    @products = Product.where(user: @user)
    authorize @dashboard
  end
end

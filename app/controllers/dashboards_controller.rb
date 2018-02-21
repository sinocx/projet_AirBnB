class DashboardsController < ApplicationController
  skip_after_action :verify_authorized

  def dashboard
    @bookings = current_user.bookings
    @products = current_user.products
  end
end

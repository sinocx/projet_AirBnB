class DashboardsController < ApplicationController
  skip_after_action :verify_authorized

  def dashboard
    @bookings = current_user.bookings
    @product_bookings = current_user.products.map{ |product| product.bookings.where(status: "Pending") }.flatten
  end
end

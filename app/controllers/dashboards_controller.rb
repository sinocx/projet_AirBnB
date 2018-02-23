class DashboardsController < ApplicationController
  skip_after_action :verify_authorized

  def dashboard
    @bookings = current_user.bookings
    @product_bookings = current_user.products.map{ |product| product.bookings.where(status: ["Pending", "Validate", "Refuse"]) }.flatten
    @product_bookings.sort_by! do |b|
      b.status
    end
    # @product_bookings = current_user.bookings

    @products = current_user.products
  end
end

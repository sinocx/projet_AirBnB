class BookingsController < ApplicationController

  def index
    @bookings = policy_scope(Booking)
  end
  def show
    @user = current_user
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def new
    @product = Product.find(params[:product_id])
    @user = current_user
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.status = "Pending"
    @product = Product.find(params[:product_id])
    @booking.user = current_user
    @booking.product = @product
     authorize @booking
    if @booking.save
      redirect_to products_path
    else
      render :new
    end
  end

  def destroy
    @user = current_user
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.destroy
  end

  def validate
    raise
    # get the booking
    # update the status
    # redirect to the dashboard
  end

  def refuse
  end

  private
  def booking_params
    params.require(:booking).permit(:checkin, :checkout)
  end
end

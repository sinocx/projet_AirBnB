class BookingsController < ApplicationController

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
      redirect_to dashboards_path
    else
      render :new
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.destroy
    redirect_to dashboards_path
  end


  def validate
    # get the bookingq
    @booking = Booking.find(params[:id])
    # update the status
    authorize @booking
    @booking.status = "Validate"
    @booking.save
    # redirect to the dashboard
    redirect_to dashboards_path
  end

  def refuse
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.status = "Refuse"
    @booking.save
    redirect_to dashboards_path
  end

  private
  def booking_params
    params.require(:booking).permit(:checkin, :checkout)
  end
end

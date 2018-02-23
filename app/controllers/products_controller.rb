class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    if params[:query].present?
      @product = policy_scope(Product).order(created_at: :desc)
      @products = Product.where("address ILIKE ?", "%#{params[:query]}%").where.not(latitude: nil, longitude: nil)
      if @products.blank?
        @products = policy_scope(Product).order(created_at: :desc).where.not(latitude: nil, longitude: nil)
      end
    else
      @products = policy_scope(Product).order(created_at: :desc).where.not(latitude: nil, longitude: nil)
    end
    @markers = @products.map do |product|
      {
        lat: product.latitude,
        lng: product.longitude#,
        # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
      }
    end

  end

  def show
    @booking = Booking.new
    @product = Product.find(params[:id])
    authorize @product
    @products = []
    @products << @product
    @markers = @products.map do |product|
      {
        lat: product.latitude,
        lng: product.longitude#,
        # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
      }
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    authorize @product
    @product.update(product_params)

  end

  def new
    @product = Product.new
    authorize @product
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user
    authorize @product
    if @product.save
      redirect_to product_path(@product)
    else
      render :new
    end
  end

  def destroy
    @product = Product.find(params[:id])
    authorize @product
    @product.destroy
    redirect_to product_path
  end

  private
  def product_params
    params.require(:product).permit(:title, :category, :price, :photo, :address, :rent, :description)
  end
end

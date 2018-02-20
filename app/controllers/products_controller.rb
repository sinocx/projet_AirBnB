class ProductsController < ApplicationController
  def index
    @products = policy_scope(Product).order(created_at: :desc)
    @product = Product.where("address ILIKE ?", "%#{params[:query]}%")
  end

  def show
    @product = Product.find(params[:id])
    authorize @product
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
    else render :new
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

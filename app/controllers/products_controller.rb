class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show

  end

  def new
  end

  def create
  end

  def destroy
  end

  private
  def product_params
    params.require(:product).permit(:title, :category, :user_id, :price, :image, :address, :rent)
  end

end

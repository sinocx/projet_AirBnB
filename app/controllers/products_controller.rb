class ProductsController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to cocktail_path(@product)
    else render :new
    end
  end

  def destroy
  end
end

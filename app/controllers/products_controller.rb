class ProductsController < ApplicationController
  def index
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
  end

  def create
  end

  def destroy
  end
end

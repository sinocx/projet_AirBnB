class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
      if @user.save
       redirect_to products_index
      else
        render :new
      end
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
  end

  def edit
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :mail, :address, :img)
  end
end
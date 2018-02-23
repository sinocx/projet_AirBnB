class UsersController < ApplicationController

  def show

    @user = current_user
     authorize @user
  end

  def new
    @user = User.new
     authorize @user
  end

  def create
    @user = User.new(user_params)
    authorize @user
    if @user.save
      if user.photo.present?
       redirect_to products_path
      else
        @user.photo = Cloudinary::Uploader.upload('avatar.jpg')
        @user.save
      end
    else
      render :new
    end
  end

  def update
    @user = User.find(params[:id])
    authorize @user
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def edit
    @user = User.find(params[:id])
    authorize @user
  end

  def destroy
    @user = User.find(params[:id])
    authorize @user
    @user.destroy
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :address, :photo)
  end
end

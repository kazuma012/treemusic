class Admin::AdminsController < ApplicationController
  before_action :authenticate_admin!

  def index
      @admin = current_admin
      @users = User.search(params[:search])
      @users2 = User.page(params[:page]).per(8).reverse_order
  end

  def show
      @admin = current_admin
      @user = User.find(params[:id])
  end

  def edit
      @admin = current_admin
      @user = User.find(params[:id])
  end

  def update
      @user = User.find(params[:id])
      if @user.update(user_params)
         redirect_to admin_admin_path(@user)
      else
         render 'edit'
      end
  end

  private

  def user_params
      params.require(:user).permit(:username, :email, :profile_image_id, :phone_number, :flag)
  end

  def if_not_admin
      redirect_to root_path unless current_user.admin?
  end

end

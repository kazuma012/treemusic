class Public::UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
      @users = User.search(params[:search])
      @users2 = User.page(params[:page])
  end
	
  def show
      @user = User.find(params[:id])
  end

  def hide
  	  @user = current_user
  	  @user.update(flag: true)
  	  reset_session
  	  redirect_to root_path, notice: 'Thank you for using this app'
  end

  def edit
  	  @user = User.find(params[:id])
      if @user != current_user
       redirect_to public_users_path, alert: 'Invalid Access'
      end
  end

  def update
      @user = User.find(params[:id])
      if @user.update(user_params)
         redirect_to public_users_path(@user.id), notice: 'Update succsessfuly'
      else
         render 'edit'
      end
  end

  def quit
      @user = current_user
  end

  private
  
  def user_params
  	  params.require(:user).permit(:username, :email, :phone_number,　:profile_image,　:profile)
  end
  
  def ensure_corrent_user
  	  @user = User.find_by(id: params[:id])
  	  if @user.id != current_user.id
  	  	 redirect_to public_users_path(current_user.id)
  	  end
  end
end

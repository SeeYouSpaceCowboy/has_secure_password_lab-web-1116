class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if(params[:user][:password] == params[:user][:password_confirmation])
      @user = User.create(user_params)

      session[:user_id] = @user.id
      session[:name] = @user.name
      session[:password] = @user.password

      redirect_to user_path(session[:user_id])
    else
      redirect_to new_user_path
    end
  end

  def user_params
    params.require(:user).permit(:name, :password)
  end
end

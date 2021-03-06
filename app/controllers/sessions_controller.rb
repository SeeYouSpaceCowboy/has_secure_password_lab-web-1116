class SessionsController < ApplicationController
  def create
    @user = User.find_by(name: params[:user][:name])

    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(session[:user_id])
    else
      redirect_to new_user_path
    end
  end

  def show
    @user = User.find(session[:user_id])
  end
end

class SessionsController < ApplicationController
  def new
  end

  def show
    @user = current_user
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      flash[:notice] = "Logged in Successfully"
      session[:user_id] = user.id
      redirect_to user_path(current_user)
    else
      flash.now[:notice] = "GTFO"
      render :new
    end
  end

  def destroy
    session.clear
    flash[:notice] = "Logged Out!"
    redirect_to login_path
  end
end

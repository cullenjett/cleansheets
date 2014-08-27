class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash[:danger] = "Oops! You messed up your info. Try again."
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You are now signed out."
    redirect_to root_path
  end
end

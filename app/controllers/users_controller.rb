class UsersController < ApplicationController
  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = "You have successfully signed up!"
      redirect_to user_path(@user)
    else
      flash[:danger] = "Oops"
      render 'pages/front'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end
end

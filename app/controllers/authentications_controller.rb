class AuthenticationsController < ApplicationController
  def index
  end

  def create
    auth_hash = request.env['omniauth.auth']
    current_user.authentications.find_or_create_by(provider: auth_hash['provider'], uid: auth_hash['uid'], user_id: current_user.id.to_s)
    flash[:success] = "You are now signed in"
    redirect_to user_path(current_user)
  end

  def destroy
  end
end

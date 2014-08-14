class AuthenticationsController < ApplicationController
  def index
  end

  def create
    auth_hash = request.env['omniauth.auth'].to_yaml
    current_user.authentications.create(provider: auth_hash['provider'], uid: auth_hash['uid'])
  end

  def destroy
  end
end

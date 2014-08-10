class PagesController < ApplicationController
  def front
    @user = User.new
  end
end

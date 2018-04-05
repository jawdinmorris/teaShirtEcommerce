class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @carts = current_user.carts.all
  end

  def index
    @users = User.all
  end
end

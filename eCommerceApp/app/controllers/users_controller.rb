class UsersController < ApplicationController

  before_action :set_admin_rights, only: [:index, :update, :destroy]

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  private

  def set_admin_rights
    @admin = current_user.admin
    if current_user.admin != true
      redirect_to items_url, notice: 'You are not authorised to perform this action.'
    end
  end

end

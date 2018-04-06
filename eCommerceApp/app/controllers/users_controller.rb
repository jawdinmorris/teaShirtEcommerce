class UsersController < ApplicationController

  before_action :set_admin_rights, only: [:index, :update, :destroy]

  def show
    @user = User.find(params[:id])
    @carts = current_user.carts.all
  end

  def index
    @users = User.all
  end

  def destroy
    @user = User.find(params[:id])
    respond_to do |format|
      format.html { redirect_to users_path, notice: 'Account was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_path, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_admin_rights
    @admin = current_user.admin
    if current_user.admin != true
      redirect_to items_url, notice: 'You are not authorised to perform this action.'
    end
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:enabled, :admin)
  end

end

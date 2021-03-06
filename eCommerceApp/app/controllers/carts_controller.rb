class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :edit, :update, :destroy]
  before_action :set_admin_rights, only: [:show]


  # GET /carts
  # GET /carts.json
  def index
    @carts = Cart.all
  end

  # GET /carts/1
  # GET /carts/1.json
  def show
    @carts = Cart.current_user
  end

  # GET /carts/new
  def new
    @cart = Cart.new
  end

  # GET /carts/1/edit
  def edit
  end

  # POST /carts
  # POST /carts.json
  def create
    @cart = Cart.new(cart_params)

    @cart.item.stock_status -= cart_params[:user_choice].to_i
    @cart.quantity = cart_params[:user_choice].to_i
    @cart.item.save

    respond_to do |format|
      if @cart.save
        @cart.user_choice = 0
        format.html { redirect_to items_path, notice: 'Cart was successfully created.' }
        format.json { render :show, status: :created, location: @cart }
      else
        format.html { render :new }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /carts/1
  # PATCH/PUT /carts/1.json
  def update
    @cart.item.stock_status -= cart_params[:user_choice].to_i
    @cart.quantity += cart_params[:user_choice].to_i
    @cart.item.save


    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to items_path, notice: 'Cart was successfully updated.' }
        format.json { render :show, status: :ok, location: @cart }
      else
        format.html { render :edit }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carts/1
  # DELETE /carts/1.json
  def destroy
    @cart.destroy
    respond_to do |format|
      format.html { redirect_to carts_url, notice: 'Cart was successfully destroyed.' }
      format.json { head :no_content }
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

    def set_admin_rights
      @admin = current_user.admin
      if current_user.admin != true
        redirect_to items_url, notice: 'You are not authorised to perform this action.'
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cart_params
      params.require(:cart).permit(:item_id, :user_id, :quantity, :user_choice)
    end
end

class CartsController < ApplicationController
  protect_from_forgery with: :exception
  before_action :current_cart
  before_action :authenticate_user!


  # def index
  #   @carts = Cart.all
  # end

  def show
    # @cart = @current_cart
    @order_items = current_order.order_items
  end

  # def destroy
  #   @cart = @current_cart
  #   @cart.destroy
  #   session[:cart_id] = nil
  #   redirect_to root_path
  # end
end

# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order, only: %i[show edit update destroy]

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.save
    WishItem.all.each do |item|
      @order.update(wish_item_id: item.id)
    end
    if @order.save
      redirect_to orders_path, notice: 'Pedido criado com sucesso.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /orders/1 or /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to admin_order_url(@order), notice: "Pedido foi atualiado com sucesso." }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end


  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:first_name, :last_name, :email, :cpf, :phone, :cellphone, :street, :district, :number,
                                  :complement, :city, :state, :zip_number, :status, :subtotal, :total, :debit_card, :credit_card,
                                  :billet, :pix, :credit_card_number, :credit_card_name, :credit_card_expired_date,
                                  :credit_card_code, :wish_item_id)
  end
end

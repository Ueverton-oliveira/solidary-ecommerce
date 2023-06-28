# frozen_string_literal: true

module Admin
  class OrdersController < BaseController
    before_action :set_order, only: %i[show edit update destroy]

    # GET /orders or /orders.json
    def index
      @orders = Order.all
    end

    # GET /orders/1 or /orders/1.json
    def show; end

    # GET /orders/new
    def new
      @order = Order.new
    end

    # GET /orders/1/edit
    def edit; end

    # POST /orders or /orders.json
    def create
      @order = Order.new(order_params)

      respond_to do |format|
        if @order.save
          format.html { redirect_to admin_order_url(@order), notice: "Pedido criado com sucesso!" }
          format.json { render :show, status: :created, location: @order }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @order.errors, status: :unprocessable_entity }
        end
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

    # DELETE /orders/1 or /orders/1.json
    def destroy
      @order.destroy

      respond_to do |format|
        format.html { redirect_to admin_orders_url, notice: "Pedido foi deletado com sucesso." }
        format.json { head :no_content }
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:first_name, :last_name, :email, :cpf, :phone, :cellphone, :street, :district, :number,
                                    :complement, :city, :state, :zip_number, :status, :subtotal, :total, :debit_card, :credit_card,
                                    :billet, :pix, :credit_card_number, :credit_card_name, :credit_card_expired_date,
                                    :credit_card_code, :wish_item_id)
    end
  end
end

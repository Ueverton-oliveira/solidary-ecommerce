class WishItemsController < ApplicationController
  before_action :set_wish_item, only: %i[ show edit update destroy ]

  # GET /wish_items or /wish_items.json
  def index
    @wish_items = WishItem.all
  end

  # GET /wish_items/1 or /wish_items/1.json
  def show
  end

  # GET /wish_items/new
  def new
    @wish_item = WishItem.new
  end

  # GET /wish_items/1/edit
  def edit
  end

  # POST /wish_items or /wish_items.json
  def create
    @wish_item = current_user.wish_items.build(product_id: params[:product_id])
    respond_to do |format|
      if @wish_item.save
        format.html { redirect_to root_path, notice: "Adicionado ao carrinho com sucesso!" }
        format.json { render :show, status: :created, location: @wish_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @wish_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wish_items/1 or /wish_items/1.json
  def update
    respond_to do |format|
      if @wish_item.update(wish_item_params)
        format.html { redirect_to wish_item_url(@wish_item), notice: "Wish item was successfully updated." }
        format.json { render :show, status: :ok, location: @wish_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @wish_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wish_items/1 or /wish_items/1.json
  def destroy
    @wish_item = current_user.wish_items.find(params[:id])

    respond_to do |format|
      @wish_item.destroy!
      format.html { redirect_to wish_items_url, notice: "Wish item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wish_item
      @wish_item = WishItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def wish_item_params
      params.require(:wish_item).permit(:product_id)
    end
end

class ClaimsController < ApplicationController
  def index
    @claims = current_user.claims
  end

  def new
    @claim = current_user.claims.new
  end

  def create
    @claim = current_user.claims.new(claims_params)
    if @claim.save
      flash[:notice] = 'Reclamação ou dúvida cadastrada com sucesso!'
      redirect_to action: :index
    else
      render :new
    end
  end

  def show; end


  def edit; end

  def update
    if @claim.update(category_params)
      redirect_to claim_path(@claim), notice: 'Categoria atualizada com sucesso.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    claim = Claim.find_by(id: params[:id])
    claim.destroy

    respond_to do |format|
      format.html { redirect_to claims_path, notice: 'Reclamação ou dúvida excluída com sucesso.' }
    end
  end

  private

  def claims_params
    params.require(:claim).permit(:name, :subject)
  end
end

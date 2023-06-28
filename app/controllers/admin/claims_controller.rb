module Admin
  class ClaimsController < BaseController
  def index
    @claims = current_user.claims
  end

  def new
    @claim = current_user.claims.new
  end

  def create
    @claim = current_user.claims.new(claims_params)
    if @claim.save
      flash[:notice] = 'Cadastrado com sucesso!'
      redirect_to action: :index
    else
      render :new
    end
  end

  def show; end


  def edit; end

  def update; end

  def destroy; end

  private

  def claims_params
    params.require(:claim).permit(:name, :subject)
  end
  end
end

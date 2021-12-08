class WinesController < ApplicationController
  before_action :set_wine, only: %i[show edit update destroy]

  # GET /wines
  def index
    @q = Wine.ransack(params[:q])
    @wines = @q.result(distinct: true).includes(:cuisine_pairings,
                                                :dish_pairings, :dishes, :cuisines).page(params[:page]).per(10)
  end

  # GET /wines/1
  def show
    @dish_pairing = DishPairing.new
    @cuisine_pairing = CuisinePairing.new
  end

  # GET /wines/new
  def new
    @wine = Wine.new
  end

  # GET /wines/1/edit
  def edit; end

  # POST /wines
  def create
    @wine = Wine.new(wine_params)

    if @wine.save
      redirect_to @wine, notice: "Wine was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /wines/1
  def update
    if @wine.update(wine_params)
      redirect_to @wine, notice: "Wine was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /wines/1
  def destroy
    @wine.destroy
    redirect_to wines_url, notice: "Wine was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_wine
    @wine = Wine.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def wine_params
    params.require(:wine).permit(:varietal)
  end
end

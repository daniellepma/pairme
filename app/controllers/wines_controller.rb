class WinesController < ApplicationController
  before_action :set_wine, only: %i[show edit update destroy]

  def index
    @q = Wine.ransack(params[:q])
    @wines = @q.result(distinct: true).includes(:cuisine_pairings,
                                                :dish_pairings, :dishes, :cuisines).page(params[:page]).per(10)
  end

  def show
    @dish_pairing = DishPairing.new
    @cuisine_pairing = CuisinePairing.new
  end

  def new
    @wine = Wine.new
  end

  def edit; end

  def create
    @wine = Wine.new(wine_params)

    if @wine.save
      redirect_to @wine, notice: "Wine was successfully created."
    else
      render :new
    end
  end

  def update
    if @wine.update(wine_params)
      redirect_to @wine, notice: "Wine was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @wine.destroy
    redirect_to wines_url, notice: "Wine was successfully destroyed."
  end

  private

  def set_wine
    @wine = Wine.find(params[:id])
  end

  def wine_params
    params.require(:wine).permit(:varietal)
  end
end

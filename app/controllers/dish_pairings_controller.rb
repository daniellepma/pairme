class DishPairingsController < ApplicationController
  before_action :set_dish_pairing, only: [:show, :edit, :update, :destroy]

  # GET /dish_pairings
  def index
    @dish_pairings = DishPairing.all
  end

  # GET /dish_pairings/1
  def show
  end

  # GET /dish_pairings/new
  def new
    @dish_pairing = DishPairing.new
  end

  # GET /dish_pairings/1/edit
  def edit
  end

  # POST /dish_pairings
  def create
    @dish_pairing = DishPairing.new(dish_pairing_params)

    if @dish_pairing.save
      redirect_to @dish_pairing, notice: 'Dish pairing was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /dish_pairings/1
  def update
    if @dish_pairing.update(dish_pairing_params)
      redirect_to @dish_pairing, notice: 'Dish pairing was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /dish_pairings/1
  def destroy
    @dish_pairing.destroy
    message = "DishPairing was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to dish_pairings_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dish_pairing
      @dish_pairing = DishPairing.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def dish_pairing_params
      params.require(:dish_pairing).permit(:dish_id, :wine_id, :description, :share_link)
    end
end

class DishPairingsController < ApplicationController
  before_action :set_dish_pairing, only: %i[show edit update destroy]

  def index
    @q = DishPairing.ransack(params[:q])
    @dish_pairings = @q.result(distinct: true).includes(:dish, :wine,
                                                        :saved_pairings).page(params[:page]).per(10)
  end

  def show
    @saved_pairing = SavedPairing.new
  end

  def new
    @dish_pairing = DishPairing.new
  end

  def edit; end

  def create
    @dish_pairing = DishPairing.new(dish_pairing_params)

    if @dish_pairing.save
      message = "DishPairing was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @dish_pairing, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @dish_pairing.update(dish_pairing_params)
      redirect_to @dish_pairing,
                  notice: "Dish pairing was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @dish_pairing.destroy
    message = "DishPairing was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to dish_pairings_url, notice: message
    end
  end

  private

  def set_dish_pairing
    @dish_pairing = DishPairing.find(params[:id])
  end

  def dish_pairing_params
    params.require(:dish_pairing).permit(:dish_id, :wine_id, :description,
                                         :share_link)
  end
end

class CuisinePairingsController < ApplicationController
  before_action :set_cuisine_pairing, only: [:show, :edit, :update, :destroy]

  # GET /cuisine_pairings
  def index
    @q = CuisinePairing.ransack(params[:q])
    @cuisine_pairings = @q.result(:distinct => true).includes(:cuisine, :wine, :saved_pairings).page(params[:page]).per(10)
  end

  # GET /cuisine_pairings/1
  def show
    @saved_pairing = SavedPairing.new
  end

  # GET /cuisine_pairings/new
  def new
    @cuisine_pairing = CuisinePairing.new
  end

  # GET /cuisine_pairings/1/edit
  def edit
  end

  # POST /cuisine_pairings
  def create
    @cuisine_pairing = CuisinePairing.new(cuisine_pairing_params)

    if @cuisine_pairing.save
      message = 'CuisinePairing was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @cuisine_pairing, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /cuisine_pairings/1
  def update
    if @cuisine_pairing.update(cuisine_pairing_params)
      redirect_to @cuisine_pairing, notice: 'Cuisine pairing was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /cuisine_pairings/1
  def destroy
    @cuisine_pairing.destroy
    message = "CuisinePairing was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to cuisine_pairings_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cuisine_pairing
      @cuisine_pairing = CuisinePairing.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def cuisine_pairing_params
      params.require(:cuisine_pairing).permit(:cuisine_id, :wine_id, :description, :share_link)
    end
end

class SavedPairingsController < ApplicationController
  before_action :current_user_must_be_saved_pairing_user,
                only: %i[edit update destroy]

  before_action :set_saved_pairing, only: %i[show edit update destroy]

  # GET /saved_pairings
  def index
    @q = current_user.saved_pairings.ransack(params[:q])
    @saved_pairings = @q.result(distinct: true).includes(:user, :cuisine,
                                                         :dish).page(params[:page]).per(10)
  end

  # GET /saved_pairings/1
  def show; end

  # GET /saved_pairings/new
  def new
    @saved_pairing = SavedPairing.new
  end

  # GET /saved_pairings/1/edit
  def edit; end

  # POST /saved_pairings
  def create
    @saved_pairing = SavedPairing.new(saved_pairing_params)

    if @saved_pairing.save
      message = "SavedPairing was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @saved_pairing, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /saved_pairings/1
  def update
    if @saved_pairing.update(saved_pairing_params)
      redirect_to @saved_pairing,
                  notice: "Saved pairing was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /saved_pairings/1
  def destroy
    @saved_pairing.destroy
    message = "SavedPairing was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to saved_pairings_url, notice: message
    end
  end

  private

  def current_user_must_be_saved_pairing_user
    set_saved_pairing
    unless current_user == @saved_pairing.user
      redirect_back fallback_location: root_path,
                    alert: "You are not authorized for that."
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_saved_pairing
    @saved_pairing = SavedPairing.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def saved_pairing_params
    params.require(:saved_pairing).permit(:user_id, :pairing_id)
  end
end

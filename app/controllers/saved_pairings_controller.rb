class SavedPairingsController < ApplicationController
  before_action :current_user_must_be_saved_pairing_user,
                only: %i[edit update destroy]

  before_action :set_saved_pairing, only: %i[show edit update destroy]

  def index
    @q = current_user.saved_pairings.ransack(params[:q])
    @saved_pairings = @q.result(distinct: true).includes(:user, :cuisine,
                                                         :dish).page(params[:page]).per(10)
  end

  def show; end

  def new
    @saved_pairing = SavedPairing.new
  end

  def edit; end

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

  def update
    if @saved_pairing.update(saved_pairing_params)
      redirect_to @saved_pairing,
                  notice: "Saved pairing was successfully updated."
    else
      render :edit
    end
  end

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

  def set_saved_pairing
    @saved_pairing = SavedPairing.find(params[:id])
  end

  def saved_pairing_params
    params.require(:saved_pairing).permit(:user_id, :pairing_id)
  end
end

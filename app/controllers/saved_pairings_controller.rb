class SavedPairingsController < ApplicationController
  before_action :set_saved_pairing, only: [:show, :edit, :update, :destroy]

  # GET /saved_pairings
  def index
    @saved_pairings = SavedPairing.all
  end

  # GET /saved_pairings/1
  def show
  end

  # GET /saved_pairings/new
  def new
    @saved_pairing = SavedPairing.new
  end

  # GET /saved_pairings/1/edit
  def edit
  end

  # POST /saved_pairings
  def create
    @saved_pairing = SavedPairing.new(saved_pairing_params)

    if @saved_pairing.save
      redirect_to @saved_pairing, notice: 'Saved pairing was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /saved_pairings/1
  def update
    if @saved_pairing.update(saved_pairing_params)
      redirect_to @saved_pairing, notice: 'Saved pairing was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /saved_pairings/1
  def destroy
    @saved_pairing.destroy
    redirect_to saved_pairings_url, notice: 'Saved pairing was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_saved_pairing
      @saved_pairing = SavedPairing.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def saved_pairing_params
      params.require(:saved_pairing).permit(:user_id, :pairing_id)
    end
end

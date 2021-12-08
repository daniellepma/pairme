class Api::V1::SavedPairingsController < Api::V1::GraphitiController
  def index
    saved_pairings = SavedPairingResource.all(params)
    respond_with(saved_pairings)
  end

  def show
    saved_pairing = SavedPairingResource.find(params)
    respond_with(saved_pairing)
  end

  def create
    saved_pairing = SavedPairingResource.build(params)

    if saved_pairing.save
      render jsonapi: saved_pairing, status: :created
    else
      render jsonapi_errors: saved_pairing
    end
  end

  def update
    saved_pairing = SavedPairingResource.find(params)

    if saved_pairing.update_attributes
      render jsonapi: saved_pairing
    else
      render jsonapi_errors: saved_pairing
    end
  end

  def destroy
    saved_pairing = SavedPairingResource.find(params)

    if saved_pairing.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: saved_pairing
    end
  end
end

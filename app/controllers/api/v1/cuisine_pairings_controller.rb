class Api::V1::CuisinePairingsController < Api::V1::GraphitiController
  def index
    cuisine_pairings = CuisinePairingResource.all(params)
    respond_with(cuisine_pairings)
  end

  def show
    cuisine_pairing = CuisinePairingResource.find(params)
    respond_with(cuisine_pairing)
  end

  def create
    cuisine_pairing = CuisinePairingResource.build(params)

    if cuisine_pairing.save
      render jsonapi: cuisine_pairing, status: 201
    else
      render jsonapi_errors: cuisine_pairing
    end
  end

  def update
    cuisine_pairing = CuisinePairingResource.find(params)

    if cuisine_pairing.update_attributes
      render jsonapi: cuisine_pairing
    else
      render jsonapi_errors: cuisine_pairing
    end
  end

  def destroy
    cuisine_pairing = CuisinePairingResource.find(params)

    if cuisine_pairing.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: cuisine_pairing
    end
  end
end

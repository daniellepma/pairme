class Api::V1::DishPairingsController < Api::V1::GraphitiController
  def index
    dish_pairings = DishPairingResource.all(params)
    respond_with(dish_pairings)
  end

  def show
    dish_pairing = DishPairingResource.find(params)
    respond_with(dish_pairing)
  end

  def create
    dish_pairing = DishPairingResource.build(params)

    if dish_pairing.save
      render jsonapi: dish_pairing, status: 201
    else
      render jsonapi_errors: dish_pairing
    end
  end

  def update
    dish_pairing = DishPairingResource.find(params)

    if dish_pairing.update_attributes
      render jsonapi: dish_pairing
    else
      render jsonapi_errors: dish_pairing
    end
  end

  def destroy
    dish_pairing = DishPairingResource.find(params)

    if dish_pairing.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: dish_pairing
    end
  end
end

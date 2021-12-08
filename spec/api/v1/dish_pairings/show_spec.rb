require 'rails_helper'

RSpec.describe "dish_pairings#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/dish_pairings/#{dish_pairing.id}", params: params
  end

  describe 'basic fetch' do
    let!(:dish_pairing) { create(:dish_pairing) }

    it 'works' do
      expect(DishPairingResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('dish_pairings')
      expect(d.id).to eq(dish_pairing.id)
    end
  end
end

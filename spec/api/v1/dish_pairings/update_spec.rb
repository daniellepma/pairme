require 'rails_helper'

RSpec.describe "dish_pairings#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/dish_pairings/#{dish_pairing.id}", payload
  end

  describe 'basic update' do
    let!(:dish_pairing) { create(:dish_pairing) }

    let(:payload) do
      {
        data: {
          id: dish_pairing.id.to_s,
          type: 'dish_pairings',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(DishPairingResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { dish_pairing.reload.attributes }
    end
  end
end

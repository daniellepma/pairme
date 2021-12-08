require 'rails_helper'

RSpec.describe "dish_pairings#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/dish_pairings", payload
  end

  describe 'basic create' do
    let(:params) do
      {
        # ... your attrs here
      }
    end
    let(:payload) do
      {
        data: {
          type: 'dish_pairings',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(DishPairingResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { DishPairing.count }.by(1)
    end
  end
end

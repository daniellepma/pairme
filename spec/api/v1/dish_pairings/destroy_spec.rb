require 'rails_helper'

RSpec.describe "dish_pairings#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/dish_pairings/#{dish_pairing.id}"
  end

  describe 'basic destroy' do
    let!(:dish_pairing) { create(:dish_pairing) }

    it 'updates the resource' do
      expect(DishPairingResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { DishPairing.count }.by(-1)
      expect { dish_pairing.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end

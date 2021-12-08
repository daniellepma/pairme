require 'rails_helper'

RSpec.describe "cuisine_pairings#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/cuisine_pairings/#{cuisine_pairing.id}"
  end

  describe 'basic destroy' do
    let!(:cuisine_pairing) { create(:cuisine_pairing) }

    it 'updates the resource' do
      expect(CuisinePairingResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { CuisinePairing.count }.by(-1)
      expect { cuisine_pairing.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end

require 'rails_helper'

RSpec.describe "cuisine_pairings#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/cuisine_pairings/#{cuisine_pairing.id}", payload
  end

  describe 'basic update' do
    let!(:cuisine_pairing) { create(:cuisine_pairing) }

    let(:payload) do
      {
        data: {
          id: cuisine_pairing.id.to_s,
          type: 'cuisine_pairings',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(CuisinePairingResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { cuisine_pairing.reload.attributes }
    end
  end
end

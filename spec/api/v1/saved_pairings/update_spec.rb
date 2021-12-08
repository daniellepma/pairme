require 'rails_helper'

RSpec.describe "saved_pairings#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/saved_pairings/#{saved_pairing.id}", payload
  end

  describe 'basic update' do
    let!(:saved_pairing) { create(:saved_pairing) }

    let(:payload) do
      {
        data: {
          id: saved_pairing.id.to_s,
          type: 'saved_pairings',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(SavedPairingResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { saved_pairing.reload.attributes }
    end
  end
end

require 'rails_helper'

RSpec.describe "saved_pairings#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/saved_pairings", payload
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
          type: 'saved_pairings',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(SavedPairingResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { SavedPairing.count }.by(1)
    end
  end
end
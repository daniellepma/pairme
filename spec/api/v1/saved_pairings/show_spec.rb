require 'rails_helper'

RSpec.describe "saved_pairings#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/saved_pairings/#{saved_pairing.id}", params: params
  end

  describe 'basic fetch' do
    let!(:saved_pairing) { create(:saved_pairing) }

    it 'works' do
      expect(SavedPairingResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('saved_pairings')
      expect(d.id).to eq(saved_pairing.id)
    end
  end
end

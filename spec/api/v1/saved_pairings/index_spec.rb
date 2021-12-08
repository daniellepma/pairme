require 'rails_helper'

RSpec.describe "saved_pairings#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/saved_pairings", params: params
  end

  describe 'basic fetch' do
    let!(:saved_pairing1) { create(:saved_pairing) }
    let!(:saved_pairing2) { create(:saved_pairing) }

    it 'works' do
      expect(SavedPairingResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['saved_pairings'])
      expect(d.map(&:id)).to match_array([saved_pairing1.id, saved_pairing2.id])
    end
  end
end

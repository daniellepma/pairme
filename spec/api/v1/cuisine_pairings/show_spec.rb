require "rails_helper"

RSpec.describe "cuisine_pairings#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/cuisine_pairings/#{cuisine_pairing.id}", params: params
  end

  describe "basic fetch" do
    let!(:cuisine_pairing) { create(:cuisine_pairing) }

    it "works" do
      expect(CuisinePairingResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("cuisine_pairings")
      expect(d.id).to eq(cuisine_pairing.id)
    end
  end
end

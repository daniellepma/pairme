require "rails_helper"

RSpec.describe "cuisine_pairings#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/cuisine_pairings", params: params
  end

  describe "basic fetch" do
    let!(:cuisine_pairing1) { create(:cuisine_pairing) }
    let!(:cuisine_pairing2) { create(:cuisine_pairing) }

    it "works" do
      expect(CuisinePairingResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["cuisine_pairings"])
      expect(d.map(&:id)).to match_array([cuisine_pairing1.id,
                                          cuisine_pairing2.id])
    end
  end
end

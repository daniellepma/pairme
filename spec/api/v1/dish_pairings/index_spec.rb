require "rails_helper"

RSpec.describe "dish_pairings#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/dish_pairings", params: params
  end

  describe "basic fetch" do
    let!(:dish_pairing1) { create(:dish_pairing) }
    let!(:dish_pairing2) { create(:dish_pairing) }

    it "works" do
      expect(DishPairingResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["dish_pairings"])
      expect(d.map(&:id)).to match_array([dish_pairing1.id, dish_pairing2.id])
    end
  end
end

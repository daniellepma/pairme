require "rails_helper"

RSpec.describe "saved_pairings#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/saved_pairings/#{saved_pairing.id}"
  end

  describe "basic destroy" do
    let!(:saved_pairing) { create(:saved_pairing) }

    it "updates the resource" do
      expect(SavedPairingResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { SavedPairing.count }.by(-1)
      expect { saved_pairing.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end

require "rails_helper"

RSpec.describe SavedPairingResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "saved_pairings",
          attributes: {},
        },
      }
    end

    let(:instance) do
      SavedPairingResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { SavedPairing.count }.by(1)
    end
  end

  describe "updating" do
    let!(:saved_pairing) { create(:saved_pairing) }

    let(:payload) do
      {
        data: {
          id: saved_pairing.id.to_s,
          type: "saved_pairings",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      SavedPairingResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { saved_pairing.reload.updated_at }
      # .and change { saved_pairing.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:saved_pairing) { create(:saved_pairing) }

    let(:instance) do
      SavedPairingResource.find(id: saved_pairing.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { SavedPairing.count }.by(-1)
    end
  end
end

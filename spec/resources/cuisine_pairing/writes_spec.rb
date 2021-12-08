require "rails_helper"

RSpec.describe CuisinePairingResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "cuisine_pairings",
          attributes: {},
        },
      }
    end

    let(:instance) do
      CuisinePairingResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { CuisinePairing.count }.by(1)
    end
  end

  describe "updating" do
    let!(:cuisine_pairing) { create(:cuisine_pairing) }

    let(:payload) do
      {
        data: {
          id: cuisine_pairing.id.to_s,
          type: "cuisine_pairings",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      CuisinePairingResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { cuisine_pairing.reload.updated_at }
      # .and change { cuisine_pairing.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:cuisine_pairing) { create(:cuisine_pairing) }

    let(:instance) do
      CuisinePairingResource.find(id: cuisine_pairing.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { CuisinePairing.count }.by(-1)
    end
  end
end

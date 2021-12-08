require "rails_helper"

RSpec.describe DishPairingResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "dish_pairings",
          attributes: {},
        },
      }
    end

    let(:instance) do
      DishPairingResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { DishPairing.count }.by(1)
    end
  end

  describe "updating" do
    let!(:dish_pairing) { create(:dish_pairing) }

    let(:payload) do
      {
        data: {
          id: dish_pairing.id.to_s,
          type: "dish_pairings",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      DishPairingResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { dish_pairing.reload.updated_at }
      # .and change { dish_pairing.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:dish_pairing) { create(:dish_pairing) }

    let(:instance) do
      DishPairingResource.find(id: dish_pairing.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { DishPairing.count }.by(-1)
    end
  end
end

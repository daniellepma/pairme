require "rails_helper"

RSpec.describe DishPairingResource, type: :resource do
  describe "serialization" do
    let!(:dish_pairing) { create(:dish_pairing) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(dish_pairing.id)
      expect(data.jsonapi_type).to eq("dish_pairings")
    end
  end

  describe "filtering" do
    let!(:dish_pairing1) { create(:dish_pairing) }
    let!(:dish_pairing2) { create(:dish_pairing) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: dish_pairing2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([dish_pairing2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:dish_pairing1) { create(:dish_pairing) }
      let!(:dish_pairing2) { create(:dish_pairing) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      dish_pairing1.id,
                                      dish_pairing2.id,
                                    ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      dish_pairing2.id,
                                      dish_pairing1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end

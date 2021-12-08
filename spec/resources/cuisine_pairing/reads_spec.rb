require 'rails_helper'

RSpec.describe CuisinePairingResource, type: :resource do
  describe 'serialization' do
    let!(:cuisine_pairing) { create(:cuisine_pairing) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(cuisine_pairing.id)
      expect(data.jsonapi_type).to eq('cuisine_pairings')
    end
  end

  describe 'filtering' do
    let!(:cuisine_pairing1) { create(:cuisine_pairing) }
    let!(:cuisine_pairing2) { create(:cuisine_pairing) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: cuisine_pairing2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([cuisine_pairing2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:cuisine_pairing1) { create(:cuisine_pairing) }
      let!(:cuisine_pairing2) { create(:cuisine_pairing) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            cuisine_pairing1.id,
            cuisine_pairing2.id
          ])
        end
      end

      context 'when descending' do
        before do
          params[:sort] = '-id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            cuisine_pairing2.id,
            cuisine_pairing1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end

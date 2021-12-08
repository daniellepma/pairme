require 'rails_helper'

RSpec.describe SavedPairingResource, type: :resource do
  describe 'serialization' do
    let!(:saved_pairing) { create(:saved_pairing) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(saved_pairing.id)
      expect(data.jsonapi_type).to eq('saved_pairings')
    end
  end

  describe 'filtering' do
    let!(:saved_pairing1) { create(:saved_pairing) }
    let!(:saved_pairing2) { create(:saved_pairing) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: saved_pairing2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([saved_pairing2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:saved_pairing1) { create(:saved_pairing) }
      let!(:saved_pairing2) { create(:saved_pairing) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            saved_pairing1.id,
            saved_pairing2.id
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
            saved_pairing2.id,
            saved_pairing1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end

require 'rails_helper'

RSpec.describe CuisinePairing, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:saved_pairings) }

    it { should belong_to(:wine) }

    it { should belong_to(:cuisine) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end

require 'rails_helper'

RSpec.describe DishPairing, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:saved_pairings) }

    it { should belong_to(:wine) }

    it { should belong_to(:dish) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end

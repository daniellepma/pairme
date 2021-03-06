require "rails_helper"

RSpec.describe Wine, type: :model do
  describe "Direct Associations" do
    it { should have_many(:dish_pairings) }

    it { should have_many(:cuisine_pairings) }
  end

  describe "InDirect Associations" do
    it { should have_many(:cuisines) }

    it { should have_many(:dishes) }
  end

  describe "Validations" do
  end
end

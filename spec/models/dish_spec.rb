require "rails_helper"

RSpec.describe Dish, type: :model do
  describe "Direct Associations" do
    it { should have_many(:dish_pairings) }
  end

  describe "InDirect Associations" do
    it { should have_one(:wine) }
  end

  describe "Validations" do
  end
end

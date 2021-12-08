require "rails_helper"

RSpec.describe SavedPairing, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:dish) }

    it { should belong_to(:cuisine) }

    it { should belong_to(:user) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end

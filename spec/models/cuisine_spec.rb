require 'rails_helper'

RSpec.describe Cuisine, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:cuisine_pairings) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end

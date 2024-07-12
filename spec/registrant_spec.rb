require 'spec_helper'

RSpec.describe Registrant do
  before(:each) do
    @registrant = Registrant.new
    @registrant_1 = Registrant.new('Bruce', 18, true)
    @registrant_2 = Registrant.new('Penny', 15)
  end

  describe '#initialize' do
    it 'exists' do
      expect(@registrant_1).to be_a(Registrant)
      expect(@registrant_2).to be_a(Registrant)
    end
  end

  xit "can have a name, age and permit" do 
    expect(@registrant_1.name).to be("Bruce")
    expect(@registrant_1.age).to be(18)
    expect(@registrant_1.permit).to be(true)
    end

  xit "does not have a permit by default" do
    expect(@registrant2.permit).to eq(false)
  end
end

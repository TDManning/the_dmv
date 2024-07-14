require 'spec_helper'

RSpec.configure do |config|
  config.formatter = :documentation
end

RSpec.describe Registrant do
  before(:each) do
    @registrant_1 = Registrant.new('Bruce', 18, true)
    @registrant_2 = Registrant.new('Penny', 16)
    @registrant_3 = Registrant.new('Tucker', 15)
  end

  describe "#exists" do 
  it 'exists' do
    expect(@registrant_1).to be_an_instance_of(Registrant)
    expect(@registrant_2).to be_an_instance_of(Registrant)
    expect(@registrant_3).to be_an_instance_of(Registrant)
    # expect(@registrant).to be_an_instance_of(Registrant)
  end
  end

  describe "#name" do 
  it 'has a name' do 
    expect(@registrant_1.name).to eq("Bruce")
    expect(@registrant_2.name).to eq("Penny")
    expect(@registrant_3.name).to eq("Tucker")
  end
  end

  describe "#age" do 
  it 'has an age' do
    expect(@registrant_1.age).to eq(18)
    expect(@registrant_2.age).to eq(16)
    expect(@registrant_3.age).to eq(15)
  end
  end

  describe "#license data" do 
  it 'has license data' do
    expect(@registrant_1.license_data).to eq({:license=>false, :renewed=>false, :written=>false})
    expect(@registrant_2.license_data).to eq({:license=>false, :renewed=>false, :written=>false})
    expect(@registrant_3.license_data).to eq({:license=>false, :renewed=>false, :written=>false})
  end
  end

  describe "#has permit" do 
  it "does have a permit" do
    expect(@registrant_1.permit?).to eq true
    expect(@registrant_2.permit?).to eq false 
    expect(@registrant_3.permit?).to eq false
  end
  end

  describe "#earned permit" do 
  it "is eligible to earn a permit at any age" do
    expect(@registrant_1.earn_permit).to eq true
    expect(@registrant_2.earn_permit).to eq true
    expect(@registrant_3.earn_permit).to eq true
  end
  end
end

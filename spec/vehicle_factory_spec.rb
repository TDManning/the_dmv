require 'spec_helper'

RSpec.configure do |config|
  config.formatter = :documentation
end

RSpec.describe VehicleFactory do
  before(:each) do
    @factory = VehicleFactory.new
    @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
  end

  describe '#initialize' do
    it 'can initialize' do
    expect(@factory).to be_an_instance_of(VehicleFactory)
    end
  end
  
  describe '#pull data' do
    it 'can pull data from the DMV Data Service' do
    expect(@factory.create_vehicles(@wa_ev_registrations)).to be_an_instance_of(Array)
    end
  end

  describe '#verify data' do
    it 'show vehicles with specific values' do
    vehicle = @factory.create_vehicles(@wa_ev_registrations)
    expect(vehicle[0].engine).to eq(:ev)
    expect(vehicle[0].make).to eq("FIAT")  
    expect(vehicle[0].model).to eq("500")
    expect(vehicle[0].registration_date).to be(nil)
    expect(vehicle[0].vin).to eq("3C3CFFGE5F")
    expect(vehicle[0].year).to eq("2015")
    end
  end 
end
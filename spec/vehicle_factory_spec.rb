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
    it 'can pull data from the WA DMV Data Service' do
      expect(@factory.create_vehicles(@wa_ev_registrations)).to be_an_instance_of(Array)
    end
  end

  describe '#verify data' do
    it 'show vehicles with specific values' do
      vehicle = @factory.create_vehicles(@wa_ev_registrations)
      expect(vehicle[0].engine).to be_a(Symbol)
      expect(vehicle[0].make).to be_a(String)  
      expect(vehicle[0].model).to be_a(String)
      expect(vehicle[0].registration_date).to eq(nil)
      expect(vehicle[0].vin).to be_a(String)
      expect(vehicle[0].year).to be_a(String)
    end
  end 
end
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
  
  describe '#create_vehicle' do
    it 'can pull data from the DMV Data Service' do
    expect(@factory.create_vehicles(@wa_ev_registrations)).to be_an_instance_of(Array)
    end
  end
end
require 'spec_helper'

RSpec.configure do |config|
  config.formatter = :documentation
end

RSpec.describe VehicleFactory do
  before(:each) do
    @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    @factory = VehicleFactory.new
  end
  
  describe '#create_vehicle' do
    it 'can pull data from the DMV Data Service' do
      factory = @factory.create_vehicles(@wa_ev_registrations)
      expect(@factory).to be_an_instance_of(VehicleFactory)
    end
  end
end
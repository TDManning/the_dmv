require 'spec_helper'

RSpec.configure do |config|
  config.formatter = :documentation
end

RSpec.describe Facility do
  before(:each) do
    @facility = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
    @bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
    @camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@facility).to be_an_instance_of(Facility)
      expect(@facility.name).to eq('DMV Tremont Branch')
      expect(@facility.address).to eq('2855 Tremont Place Suite 118 Denver CO 80205')
      expect(@facility.phone).to eq('(720) 865-4600')
      expect(@facility.services).to eq([])
      expect(@facility.collected_fees).to eq 0
    end
  end

  describe '#add service' do
    it 'can add available services' do
      expect(@facility.services).to eq([])
      @facility.add_service('New Drivers License')
      @facility.add_service('Renew Drivers License')
      @facility.add_service('Vehicle Registration')
      expect(@facility.services).to eq(['New Drivers License', 'Renew Drivers License', 'Vehicle Registration'])
    end
  end

  describe "#register_vehicle" do 
    it 'has a Vehicle Registration service' do 
      expect(@cruz).to be_an_instance_of(Vehicle)
      expect(@facility.add_service('Vehicle Registration')).to eq(["Vehicle Registration"])
      expect(@facility.registered_vehicles).to eq([])
      expect(@facility.collected_fees).to eq(0) 
      expect(@cruz.registration_date).to be(nil)
    end
  end

  describe "#register_vehicle cruz" do 
    it 'can register a specific vehicle, regular type' do 
      expect(@cruz).to be_an_instance_of(Vehicle)
      expect(@cruz.plate_type).to eq(:regular)
      expect(@facility.collected_fees).to eq(100) 
      expect(@cruz.registration_date).to be(Date.today)
    end
  end

  describe "#register_vehicle camaro" do 
    it 'can register a specific vehicle, antique type' do 
      expect(@camaro).to be_an_instance_of(Vehicle)
      expect(@camaro.plate_type).to eq(:antique)
      expect(@facility.collected_fees).to eq(25) 
      expect(@camaro.registration_date).to be(Date.today)
    end
  end

  describe "#register_vehicle bolt" do 
    it 'can register a specific vehicle, ev type' do 
      expect(bolt).to be_an_instance_of(Vehicle)
      expect(@camaro.plate_type).to eq(:ev)
      expect(@facility.collected_fees).to eq(200) 
      expect(@camaro.registration_date).to be(Date.today)
   end
  end

  describe "#compile data" do 
    it 'can compile all registered vehicle data' do 
      expect(@facility.registered_vehicles).to eq([array of all three vehicles])
      expect(@facility.collected_fees).to eq(325) 
   end
  end

  describe "#show other facilities" do 
    it 'cannot register vehicles when the facility is not offering the service' do 
      facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
      expect(@facility_2.services).to eq([]) 
      expect(@facility_2.register_vehicle(bolt)).to eq(nil) 
      expect(@facility_2.registered_vehicles).to eq([])
      expect(@facility.collected_fees).to eq(0)
    end
  end
end

# Next I will actually register cruz starting at:
# @facility.register_vehicle(cruz)
# cruz.registration_date
# cruz.plate_type
# facility_1.registered_vehicles -here we are checking that the vehicle is actually registered

# facility_1.collected_fees -test to show hoe much $$ in fees has been collected so far

#Repeat the process for the camaro and bolt
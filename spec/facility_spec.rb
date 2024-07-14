require 'spec_helper'

RSpec.configure do |config|
  config.formatter = :documentation
end

RSpec.describe Facility do
  before(:each) do
    @facility = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    @facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
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
      expect(@cruz.registration_date).to eq(nil)
    end
  end

  describe "#register_vehicle cruz" do 
    it 'can register a specific vehicle, regular type' do 
      expect(@cruz).to be_an_instance_of(Vehicle)
      expect(@facility.add_service('Vehicle Registration')).to eq(["Vehicle Registration"])
      @facility.register_vehicle(@cruz)
      expect(@facility.registered_vehicles).to eq([@cruz]) 
      expect(@cruz.plate_type).to eq(:regular)
      expect(@facility.collected_fees).to eq(100) 
      expect(@cruz.registration_date).to eq(Date.today)
    end
  end

  describe "#register_vehicle camaro" do 
    it 'can register a specific vehicle, antique type' do 
      expect(@camaro).to be_an_instance_of(Vehicle)
      expect(@facility.add_service('Vehicle Registration')).to eq(["Vehicle Registration"])
      @facility.register_vehicle(@camaro)
      expect(@camaro.plate_type).to eq(:antique)
      expect(@facility.collected_fees).to eq(25) 
      expect(@camaro.registration_date).to eq(Date.today)
    end
  end

  describe "#register_vehicle bolt" do 
    it 'can register a specific vehicle, ev type' do 
      expect(@bolt).to be_an_instance_of(Vehicle)
      expect(@facility.add_service('Vehicle Registration')).to eq(["Vehicle Registration"])
      @facility.register_vehicle(@bolt)
      expect(@bolt.plate_type).to eq(:ev)
      expect(@facility.collected_fees).to eq(200) 
      expect(@bolt.registration_date).to eq(Date.today)
    end
  end

  describe "#compile data" do 
    it 'can compile all registered vehicle data' do 
      expect(@facility.add_service('Vehicle Registration')).to eq(["Vehicle Registration"])
      @facility.register_vehicle(@cruz)
      @facility.register_vehicle(@camaro)
      @facility.register_vehicle(@bolt)
      expect(@facility.registered_vehicles).to eq([@cruz, @camaro, @bolt])
      expect(@facility.collected_fees).to eq(325) 
    end
  end

  describe "#show other facilities" do 
    it 'cannot register vehicles when the facility is not offering the service' do 
      facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
      expect(@facility_2.services).to eq([]) 
      expect(@facility_2.register_vehicle(@bolt)).to eq(nil) 
      expect(@facility_2.registered_vehicles).to eq([])
      expect(@facility_2.collected_fees).to eq(0)
    end
  end

  describe "#written test given" do 
    it "has not given a written test" do
      expect(@facility.administer_written_test(@registrant_1)).to eq false
      expect(@facility.administer_written_test(@registrant_2)).to eq false
      expect(@facility.administer_written_test(@registrant_3)).to eq false
    end
  end

  describe "#written test given" do 
    xit "will give a written test to someone 16 years and older" do
      @facility.add_service('Written Test')
      @facility.administer_written_test(@registrant_1)
      @facility.administer_written_test(@registrant_2)
      @facility.administer_written_test(@registrant_3)
      expect(@facility.administer_written_test(@registrant_1)).to eq true
      expect(@facility.administer_written_test(@registrant_2)).to eq true
      expect(@facility.administer_written_test(@registrant_3)).to eq false
    end
  end

  describe "#updated written test" do 
    xit 'has updated written test license data' do
      @facility.add_service('Written Test')
      @facility.administer_written_test(@registrant_1)
      @facility.administer_written_test(@registrant_2)
      @facility.administer_written_test(@registrant_3)
      expect(@registrant_1.license_data).to eq({:license=>false, :renewed=>false, :written=>true})
      expect(@registrant_2.license_data).to eq({:license=>false, :renewed=>false, :written=>true})
      expect(@registrant_3.license_data).to eq({:license=>false, :renewed=>false, :written=>false})
    end
  end

  describe "#road test given" do 
    xit "has not given a road test" do
      expect(@facility.administer_road_test(@registrant_1)).to eq false
      expect(@facility.administer_road_test(@registrant_2)).to eq false
      expect(@facility.administer_road_test(@registrant_3)).to eq false
    end
  end

  describe "#road test given" do 
    xit "will give a road test to someone who passed the written test" do
      @facility.add_service('Road Test')
      @facility.administer_road_test(@registrant_1)
      @facility.administer_road_test(@registrant_2)
      @facility.administer_road_test(@registrant_3)
      expect(@facility.administer_road_test(@registrant_1)).to eq true
      expect(@facility.administer_road_test(@registrant_2)).to eq true
      expect(@facility.administer_road_test(@registrant_3)).to eq false
    end
  end

  describe "#updated road test" do 
    xit 'has given road test and license renewed for eligible registrants' do
      @facility.add_service('Written Test')
      @facility.add_service('Road Test')
      @facility.add_service('Renew License')
      @facility.administer_written_test(@registrant_1)
      @facility.administer_written_test(@registrant_2)
      @facility.administer_written_test(@registrant_3)
      @facility.administer_road_test(@registrant_1)
      @facility.administer_road_test(@registrant_2)
      @facility.administer_road_test(@registrant_3)
      @facility.renew_drivers_license(@registrant_1)
      @facility.renew_drivers_license(@registrant_2)
      @facility.renew_drives_license(@registrant_3)
      expect(@registrant_1.license_data).to eq({:license=>true, :renewed=>true, :written=>true})
      expect(@registrant_2.license_data).to eq({:license=>true, :renewed=>true, :written=>true})
      expect(@registrant_3.license_data).to eq({:license=>false, :renewed=>false, :written=>false})
    end
  end


end

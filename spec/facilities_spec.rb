require 'spec_helper'

RSpec.configure do |config|
  config.formatter = :documentation
end

RSpec.describe Facilities do
  before(:each) do
    @facility = Facilities.new
  end

  describe '#initialize' do
    it 'can initialize' do
    expect(@facility).to be_an_instance_of(Facilities)
    end
  end
  
  describe '#pull data CO' do
    xit 'can pull data from the CO DMV Data Service' do
      @co_ev_registrations = DmvDataService.new.co_dmv_office_locations
      expect(@facility.create_vehicles(@co_ev_registrations)).to be_an_instance_of(Array)
    end
  end

  describe '#verify data CO' do
    xit 'show vehicles with specific values at CO DMV' do
      @co_ev_registrations = DmvDataService.new.co_dmv_office_locations
      vehicle = @facility.create_vehicles(@co_ev_registrations)
    # expect(vehicle[0].engine).to eq(:ev)
    # expect(vehicle[0].make).to eq("FIAT")  
    # expect(vehicle[0].model).to eq("500")
    # expect(vehicle[0].registration_date).to be(nil)
    # expect(vehicle[0].vin).to eq("3C3CFFGE5F")
    # expect(vehicle[0].year).to eq("2015")
    end
  end 

  describe '#pull data NY' do
    xit 'can pull data from the NY DMV Data Service' do
    @ny_ev_registrations = DmvDataService.new.ny_dmv_office_locations
    expect(@facility.create_vehicles(@ny_ev_registrations)).to be_an_instance_of(Array)
    end
  end

  describe '#verify data NY' do
    xit 'show vehicles with specific values at NY DMV' do
      @ny_ev_registrations = DmvDataService.new.ny_dmv_office_locations
      vehicle = @facility.create_vehicles(@ny_ev_registrations)
  #   expect(vehicle[0].engine).to eq(:ev)
  #   expect(vehicle[0].make).to eq("FIAT")  
  #   expect(vehicle[0].model).to eq("500")
  #   expect(vehicle[0].registration_date).to be(nil)
  #   expect(vehicle[0].vin).to eq("3C3CFFGE5F")
  #   expect(vehicle[0].year).to eq("2015")
    end
  end 
  
  describe '#pull data MO' do
    xit 'can pull data from the MO DMV Data Service' do
      @mo_ev_registrations = DmvDataService.new.mo_dmv_office_locations
      expect(@facility.create_vehicles(@mo_ev_registrations)).to be_an_instance_of(Array)
      end
    end

  describe '#verify data MO' do
    xit 'show vehicles with specific values at MO DMV' do
      @mo_ev_registrations = DmvDataService.new.mo_dmv_office_locations
      vehicle = @facility.create_vehicles(@mo_ev_registrations)
  #   expect(vehicle[0].engine).to eq(:ev)
  #   expect(vehicle[0].make).to eq("FIAT")  
  #   expect(vehicle[0].model).to eq("500")
  #   expect(vehicle[0].registration_date).to be(nil)
  #   expect(vehicle[0].vin).to eq("3C3CFFGE5F")
  #   expect(vehicle[0].year).to eq("2015")
      end
    end 
  end
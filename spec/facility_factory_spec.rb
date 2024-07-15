require 'spec_helper'

RSpec.configure do |config|
  config.formatter = :documentation
end

RSpec.describe FacilityFactory do
  before(:each) do
    @facility_factory = FacilityFactory.new
    @co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations
    @ny_dmv_office_locations = DmvDataService.new.ny_dmv_office_locations
    @mo_dmv_office_locations = DmvDataService.new.mo_dmv_office_locations
    @colorado_facilities = FacilityFactory.new
    @new_york_facilities = FacilityFactory.new
    @missouri_facilities = FacilityFactory.new
  end

  describe '#initialize' do
    it 'can initialize' do
    expect(@facility_factory).to be_an_instance_of(FacilityFactory)
    end
  end
  
  describe '#pull data CO' do
    it 'can pull data from the CO DMV Data Service' do
      expect(@facility_factory.create_co_facility(@co_dmv_office_locations)).to be_an_instance_of(Array)
    end
  end

  describe '#verify data CO' do
    it 'show facilities with specific values at CO DMV' do
      @co_ev_registrations = DmvDataService.new.co_dmv_office_locations
      colorado_facilities = @facility_factory.create_co_facility(@co_dmv_office_locations)
      expect(colorado_facilities[0].address).to be_a(String)
      expect(colorado_facilities[0].collected_fees).to be_a(Symbol)
      expect(colorado_facilities[0].name).to be_a(String)
      expect(colorado_facilities[0].phone).to be_a(String)
      expect(colorado_facilities[0].registered_vehicles).to be_an_instance_of(Array)
      expect(colorado_facilities[0].services).to be_an_instance_of(Array)
    end
  end 

  describe '#pull data NY' do
    it 'can pull data from the NY DMV Data Service' do
      expect(@facility_factory.create_ny_facility(@ny_dmv_office_locations)).to be_an_instance_of(Array)
    end
  end

  describe '#verify data NY' do
    it 'show facilities with specific values at NY DMV' do
      @ny_ev_registrations = DmvDataService.new.ny_dmv_office_locations
      new_york_facilities = @facility_factory.create_ny_facility(@ny_dmv_office_locations)
      expect(colorado_facilities[0].address).to be_a(String)
      expect(colorado_facilities[0].collected_fees).to be_a(Symbol)
      expect(colorado_facilities[0].name).to be_a(String)
      expect(colorado_facilities[0].phone).to be_a(String)
      expect(colorado_facilities[0].registered_vehicles).to be_an_instance_of(Array)
      expect(colorado_facilities[0].services).to be_an_instance_of(Array)
    end
  end 

  describe '#pull data MO' do
    it 'can pull data from the MO DMV Data Service' do
      expect(@facility_factory.create_mo_facility(@mo_dmv_office_locations)).to be_an_instance_of(Array)
    end
  end

  describe '#verify data MO' do
    it 'show facilities with specific values at MO DMV' do
      @mo_ev_registrations = DmvDataService.new.mo_dmv_office_locations
      missouri_facilities = @facility_factory.create_mo_facility(@mo_dmv_office_locations)
      expect(colorado_facilities[0].address).to be_a(String)
      expect(colorado_facilities[0].collected_fees).to be_a(Symbol)
      expect(colorado_facilities[0].name).to be_a(String)
      expect(colorado_facilities[0].phone).to be_a(String)
      expect(colorado_facilities[0].registered_vehicles).to be_an_instance_of(Array)
      expect(colorado_facilities[0].services).to be_an_instance_of(Array)
    end
  end 
end
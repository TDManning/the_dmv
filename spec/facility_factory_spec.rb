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
      # require 'pry'; binding.pry
    end
  end

  describe '#verify data CO' do
    it 'show facilities with specific values at CO DMV' do
      @co_ev_registrations = DmvDataService.new.co_dmv_office_locations
      colorado_facility = @facility_factory.create_co_facility(@co_dmv_office_locations)
    expect(colorado_facility[0].address).to eq(nil)
    expect(colorado_facility[0].collected_fees).to eq(0)
    expect(colorado_facility[0].name).to eq(nil)
    expect(colorado_facility[0].phone).to eq("(720) 865-4600")
    expect(colorado_facility[0].registered_vehicles).to eq([])
    expect(colorado_facility[0].services).to eq([])
    end
  end 

end





#   describe '#pull data NY' do
#     xit 'can pull data from the NY DMV Data Service' do
#       @ny_ev_registrations = DmvDataService.new.ny_dmv_office_locations
#       expect(@facility_factory.create_vehicles(@ny_ev_registrations)).to be_an_instance_of(Array)
#     end
#   end

#   describe '#verify data NY' do
#     xit 'show vehicles with specific values at NY DMV' do
#       @ny_ev_registrations = DmvDataService.new.ny_dmv_office_locations
#       vehicle = @facility_factory.create_vehicles(@ny_ev_registrations)
#   #   expect(vehicle[0].engine).to eq(:ev)
#   #   expect(vehicle[0].make).to eq("FIAT")  
#   #   expect(vehicle[0].model).to eq("500")
#   #   expect(vehicle[0].registration_date).to be(nil)
#   #   expect(vehicle[0].vin).to eq("3C3CFFGE5F")
#   #   expect(vehicle[0].year).to eq("2015")
#     end
#   end 
  
#   describe '#pull data MO' do
#     xit 'can pull data from the MO DMV Data Service' do
#       @mo_ev_registrations = DmvDataService.new.mo_dmv_office_locations
#       expect(@facility_factory.create_vehicles(@mo_ev_registrations)).to be_an_instance_of(Array)
#     end
#   end

#   describe '#verify data MO' do
#     xit 'show vehicles with specific values at MO DMV' do
#       @mo_ev_registrations = DmvDataService.new.mo_dmv_office_locations
#       vehicle = @facility_factory.create_vehicles(@mo_ev_registrations)
#   #   expect(vehicle[0].engine).to eq(:ev)
#   #   expect(vehicle[0].make).to eq("FIAT")  
#   #   expect(vehicle[0].model).to eq("500")
#   #   expect(vehicle[0].registration_date).to be(nil)
#   #   expect(vehicle[0].vin).to eq("3C3CFFGE5F")
#   #   expect(vehicle[0].year).to eq("2015")
#       end
#     end 
#   end

# #   new_york_facilities = DmvDataService.new.ny_dmv_office_locations

# # missouri_facilities = DmvDataService.new.mo_dmv_office_locations
class FacilityFactory
  attr_reader :created_facility

  def initialize
    @created_facility = created_facility
  end
  
  def create_co_facility(locations)
    created_facility = []

    locations.map do |location|
    
      specific_location = {
        address: location[:address], 
        collected_fees: location[:collected_fees],
        name: location[:name],
        phone: location[:phone],
        registered_vehicles: location[:registered_vehicles],
        services: location[:services]}

    co_dmv = Facility.new(specific_location)
    created_facility << co_dmv
    end
    created_facility
  end

  def create_ny_facility(locations)
    created_facility = []

    locations.map do |location|
      specific_location = {
        address: location[:address], 
        collected_fees: location[:collected_fees],
        name: location[:name],
        phone: location[:phone],
        registered_vehicles: location[:registered_vehicles],
        services: location[:services]}

    ny_dmv = Facility.new(specific_location)
    created_facility << ny_dmv
    end
    created_facility
  end

def create_mo_facility(locations)
  created_facility = []

  locations.map do |location|
    specific_location = {
      address: location[:address], 
      collected_fees: location[:collected_fees],
      name: location[:name],
      phone: location[:phone],
      registered_vehicles: location[:registered_vehicles],
      services: location[:services]}

    mo_dmv = Facility.new(specific_location)
    created_facility << mo_dmv
    end
    created_facility
  end
end
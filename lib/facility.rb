class Facility
  attr_reader :name, :address, :phone, :services, :collected_fees

  def initialize(facility_hash)
    @facility
    @name = facility_hash[:name]
    @address = facility_hash[:address]
    @phone = facility_hash[:phone]
    @services = []
    @collected_fees = 0

  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    
  end

  def collected_fees

  end
end

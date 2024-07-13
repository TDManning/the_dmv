class Facility
  attr_reader :name, :address, :phone, :services, :collected_fees, :registered_vehicles

  def initialize(facility_hash)
    # @facility
    @name = facility_hash[:name]
    @address = facility_hash[:address]
    @phone = facility_hash[:phone]
    @services = []
    @collected_fees = 0
    @registered_vehicles = []
  end

  def add_service(service)
    @services << service
  end

  # def register_vehicle(vehicle)
  #   if @services.include?("Vehicle Registration")
  #     @registered_vehicles << vehicle
  #   end
  #   collect_fees(vehicle)
  # end

  def register_vehicle(vehicle)
    if @services.include?("Vehicle Registration") 
      @registered_vehicles << vehicle 
      vehicle.registration_date
      collect_fees(vehicle)
      @registered_vehicles
    else
      nil
    end
  end 

  def collect_fees(vehicle)
    if vehicle.plate_type == :antique
      @collected_fees += 25
    elsif vehicle.plate_type == :ev
      @collected_fees += 200
    else
      @collected_fees += 100
    end 
  end

  def registration_date
    nil 
    if @facility.add_service = ["Vehicle Registration"]
    @registration_date = Date.today.year
    end
  end
  
end



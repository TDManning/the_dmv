class VehicleFactory
  attr_reader :created_vehicles

  def initialize
    @created_vehicles = created_vehicles
  end
  
  def create_vehicles(registrations)
    created_vehicles = []

    registrations.map do |registration|
      specific_vehicle = {
        engine: :ev, 
        vin: registration[:vin_1_10], 
        year: registration[:model_year], 
        make: registration[:make],
        model: registration[:model], 
        engine:  :ev}

    vehicle = Vehicle.new(specific_vehicle)
    created_vehicles << vehicle
    end
    created_vehicles
  end
end


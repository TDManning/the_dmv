class VehicleFactory
  attr_reader :created_vehicles

  def initialize
    @created_vehicles = created_vehicles
  end
  
  def create_vehicles(dmv_registrations)
    created_vehicles = []
    # created_vehicles = dmv_registrations.map do |registration|
      @created_vehicles =
      vehicle_data = {engine: :ev} 
      vehicle_data[:vin] = registration[:vin_1_10] 
      vehicle_data[:year] = registration[:model_year] 
      vehicle_data[:make] = registration[:make] 
      vehicle_data[:model] = registration[:model] 
      vehicle_data[:engine] = :ev
    created_vehicles << VehicleFactory.new(vehicle_data)
    end
    created_vehicles
  end
end

# def create_vehicles(dmv_registrations)
#   created_vehicles = []
#   # created_vehicles = dmv_registrations.map do |registration|
#     @created_vehicles =
#     vehicle_data = {engine: :ev} 
#     vehicle_data[:vin] = registration[:vin_1_10] 
#     vehicle_data[:year] = registration[:model_year] 
#     vehicle_data[:make] = registration[:make] 
#     vehicle_data[:model] = registration[:model] 
#     vehicle_data[:engine] = :ev
#   created_vehicles << VehicleFactory.new(vehicle_data)
#   end
#   created_vehicles
# end
# end

  # attr_accessor :registration_date

  # def initialize(vehicle_details)
  #   @vin = vehicle_details[:vin]
  #   @year = vehicle_details[:year]
  #   @make = vehicle_details[:make]
  #   @model = vehicle_details[:model]
  #   @engine = vehicle_details[:engine]
  #   @registration_date = nil
  # end
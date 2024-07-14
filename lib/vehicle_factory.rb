class VehicleFactory
  
  def create_vehicles(dmv_registrations)
    dmv_registrations.map do |registration|
      vehicle_data = {engine: :ev} 
      vehicle_data[:vin] = registration[:vin_1_10] 
      vehicle_data[:year] = registration[:model_year] 
      vehicle_data[:make] = registration[:make] 
      vehicle_data[:model_year] = registration[:model] 
      vehicle_data[:engine] = :ev

      Vehicle.new(vehicle_data)
    end
  end
end

  # attr_accessor :registration_date

  # def initialize(vehicle_details)
  #   @vin = vehicle_details[:vin]
  #   @year = vehicle_details[:year]
  #   @make = vehicle_details[:make]
  #   @model = vehicle_details[:model]
  #   @engine = vehicle_details[:engine]
  #   @registration_date = nil
  # end
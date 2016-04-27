class Search < ActiveRecord::Base
  #def vehicles
  #  @vehicles ||= find_vehicles
  #end
  
  #private 
  
  def search_vehicles
    vehicles = Vehicle.all
    
    vehicles = vehicles.where(["make LIKE ?", make]) if make.present?
    vehicles = vehicles.where(["model LIKE ?", model]) if model.present?
    vehicles = vehicles.where(["fueltype LIKE ?", fueltype]) if fueltype.present?
    vehicles = vehicles.where(["bodytype LIKE ?", bodytype]) if bodytype.present?
    vehicles = vehicles.where(["transmission LIKE ?", transmission]) if transmission.present?
    vehicles = vehicles.where(["price >= ?", min_price]) if min_price.present?
    vehicles = vehicles.where(["price <= ?", max_price]) if max_price.present?
    vehicles = vehicles.where(["year >= ?", min_year]) if min_year.present?
    vehicles = vehicles.where(["year <= ?", max_year]) if max_year.present?
    return vehicles
  end
  
end

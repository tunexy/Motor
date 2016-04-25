# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

d1 = DateTime.new(2011,04,22)
d2 = DateTime.new(1995,04,11)
d3 = DateTime.new(2001,11,28)
d4 = DateTime.new(2006,01,28)

de1 = DateTime.new(2018,06,22)
de2 = DateTime.new(2016,12,22)
du1 = DateTime.new(2018,02,22)
du2 = DateTime.new(2016,10,22)
dd1 = DateTime.new(2018,03,12)
dd2 = DateTime.new(2016,07,20)

  Vehicle.create! :description => "First seeded Vehicle", :make => "BMW", :model => "7 Series", :year => d1,
  :enginesize => 2.4, :cupiccapacity => 5, :price => 16000, :bodytype => "Saloon", :fueltype => "Petrol",
  :milleage => 109600, :transmission => "Manual", :taxdue => dd1, :nctdue => du1, :platenumber => "05D3345"
  
  Vehicle.create! :description => "Nice Vehicle but cost too much", :make => "Peugeot", :model => "206", :year => d4,
  :enginesize => 1.6, :cupiccapacity => 5, :price => 4800, :bodytype => "Saloon", :fueltype => "Petrol",
  :milleage => 204600, :transmission => "Manual", :taxdue => dd1, :nctdue => du2, :platenumber => "05C15345"
  
  Vehicle.create! :description => "Its a grand family car", :make => "BMW", :model => "3 Series", :year => d2,
  :enginesize => 3.4, :cupiccapacity => 5, :price => 6800, :bodytype => "Saloon", :fueltype => "Petrol",
  :milleage => 104600, :transmission => "Manual", :taxdue => de1, :nctdue => dd2, :platenumber => "05W5545"
  
  Vehicle.create! :description => "First seed Book", :make => "Volkswagen", :model => "Polo", :year => d2,
  :enginesize => 1.6, :cupiccapacity => 5, :price => 1600, :bodytype => "Saloon", :fueltype => "Petrol",
  :milleage => 100600, :transmission => "Manual", :taxdue => du1, :nctdue => du2, :platenumber => "05C2388"
  
  Vehicle.create! :description => "Great fancy car for first class ", :make => "Land Rover", :model => "Rangerover", :year => d1,
  :enginesize => 3.0, :cupiccapacity => 5, :price => 200800, :bodytype => "Estate", :fueltype => "Diesel",
  :milleage => 74600, :transmission => "Automatic", :taxdue => dd1, :nctdue => du2, :platenumber => "09T2335"
  
  Vehicle.create! :description => "Best selling Toyota great quality never going to let you down ",
  :make => "Toyota", :model => "Avensis", :year => d3,
  :enginesize => 2.4, :cupiccapacity => 5, :price => 16800, :bodytype => "Saloon", :fueltype => "Diesel",
  :milleage => 54600, :transmission => "Manual", :taxdue => du1, :nctdue => de2, :platenumber => "05D2945"
  
  Vehicle.create! :description => "First seed Book", :make => "Volkswagen", :model => "Golf", :year => d4,
  :enginesize => 2.0, :cupiccapacity => 5, :price => 8800, :bodytype => "Hatchback", :fueltype => "Diesel",
  :milleage => 82600, :transmission => "Automatic", :taxdue => dd1, :nctdue => du2, :platenumber => "01D2355"
  
  Vehicle.create! :description => "Family car with all the room your kids want", :make => "Volvo", :model => "XC90", :year => d2,
  :enginesize => 2.4, :cupiccapacity => 8, :price => 7800, :bodytype => "SUV", :fueltype => "Diesel",
  :milleage => 94600, :transmission => "Automatic", :taxdue => de1, :nctdue => dd2, :platenumber => "06D2345"
  
  Vehicle.create! :description => "Need to travel thats why i need to sell this car ", :make => "Opel", 
  :model => "Insignia", :year => d3,
  :enginesize => 2.0, :cupiccapacity => 5, :price => 10800, :bodytype => "Hatchback", :fueltype => "Diesel",
  :milleage => 204600, :transmission => "Manual", :taxdue => du1, :nctdue => dd1, :platenumber => "03C2345"
  

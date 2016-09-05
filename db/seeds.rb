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

  Vehicle.create! :description => "First seeded Vehicle", :make => "BMW", :model => "5 Series", :year => d2,
  :enginesize => 2.8, :cupiccapacity => 5, :price => 12000, :bodytype => "Saloon", :fueltype => "Petrol",
  :milleage => 109600, :transmission => "Manual", :taxdue => dd1, :nctdue => du1, :platenumber => "03D3445", :user_id => 2
  
  Vehicle.create! :description => "Nice Vehicle but cost too much", :make => "Peugeot", :model => "206", :year => d4,
  :enginesize => 1.6, :cupiccapacity => 5, :price => 3800, :bodytype => "Saloon", :fueltype => "Petrol",
  :milleage => 204600, :transmission => "Manual", :taxdue => dd1, :nctdue => du2, :platenumber => "04C15345", :user_id => 2
  
  Vehicle.create! :description => "Its a grand family car", :make => "BMW", :model => "3 Series", :year => d2,
  :enginesize => 3.4, :cupiccapacity => 5, :price => 7000, :bodytype => "Saloon", :fueltype => "Petrol",
  :milleage => 104600, :transmission => "Manual", :taxdue => de1, :nctdue => dd2, :platenumber => "04T5545", :user_id => 2
  
  Vehicle.create! :description => "First seed Book", :make => "Volkswagen", :model => "Polo", :year => d2,
  :enginesize => 1.6, :cupiccapacity => 5, :price => 3000, :bodytype => "Saloon", :fueltype => "Petrol",
  :milleage => 100600, :transmission => "Manual", :taxdue => du1, :nctdue => du2, :platenumber => "06D2388", :user_id => 2
  
  Vehicle.create! :description => "Great fancy car for first class ", :make => "Land Rover", :model => "Rangerover", :year => d1,
  :enginesize => 3.0, :cupiccapacity => 5, :price => 20800, :bodytype => "Estate", :fueltype => "Diesel",
  :milleage => 74600, :transmission => "Automatic", :taxdue => dd1, :nctdue => du2, :platenumber => "08OY2335", :user_id => 2
  
  Vehicle.create! :description => "Best selling Toyota great quality never going to let you down ",
  :make => "Toyota", :model => "Avensis", :year => d3,
  :enginesize => 2.4, :cupiccapacity => 5, :price => 12800, :bodytype => "Saloon", :fueltype => "Diesel",
  :milleage => 54600, :transmission => "Manual", :taxdue => du1, :nctdue => de2, :platenumber => "02D4945", :user_id => 2
  
  Vehicle.create! :description => "First seed Book", :make => "Volkswagen", :model => "Golf", :year => d4,
  :enginesize => 2.0, :cupiccapacity => 5, :price => 9500, :bodytype => "Hatchback", :fueltype => "Diesel",
  :milleage => 82600, :transmission => "Automatic", :taxdue => dd1, :nctdue => du2, :platenumber => "04D2355", :user_id => 2
  
  Vehicle.create! :description => "Family car with all the room your kids want", :make => "Volvo", :model => "XC90", :year => d2,
  :enginesize => 2.4, :cupiccapacity => 8, :price => 6500, :bodytype => "SUV", :fueltype => "Diesel",
  :milleage => 94600, :transmission => "Automatic", :taxdue => de1, :nctdue => dd2, :platenumber => "09D6345", :user_id => 2
  
  Vehicle.create! :description => "Need to travel thats why i need to sell this car ", :make => "Opel", 
  :model => "Insignia", :year => d3, :enginesize => 2.0, :cupiccapacity => 5, :price => 10800, 
  :bodytype => "Hatchback", :fueltype => "Diesel", :milleage => 200000, :transmission => "Manual", 
  :taxdue => du1, :nctdue => dd1, :platenumber => "03C4545", :user_id => 2
  

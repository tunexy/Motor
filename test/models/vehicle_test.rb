require 'test_helper'
require 'rubygems'
require 'nokogiri'
require 'open-uri'

url = "https://www.donedeal.ie/cars-for-sale/vauxhall-insignia-2012/13272874"
doc = Nokogiri::HTML(open(url))
puts doc.at_css("title").text

#class VehicleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  
  
  # end
#end

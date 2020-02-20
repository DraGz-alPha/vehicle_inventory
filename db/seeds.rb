# frozen_string_literal: true

require 'net/http'
require 'uri'
require 'json'

uri = URI.parse('https://data.winnipeg.ca/resource/bhrt-29rb.json')

response = Net::HTTP.get_response(uri)

parking_tickets = JSON.parse(response.body)

# puts "Number of tickets: #{parking_tickets.count}"

# WORKS
# parking_tickets.each do |ticket|
#   puts ticket['ticket_number']
# end

ParkingTicket.destroy_all
Vehicle.destroy_all
Owner.destroy_all

NUMBER_OF_OWNERS = 100
# NUMBER_OF_VEHICLES = 150
# NUMBER_OF_PARKING_TICKETS = 98
current_ticket_index = 0

NUMBER_OF_OWNERS.times do
  owner_first_name = Faker::Name.first_name
  owner_middle_name = Faker::Name.middle_name
  owner_last_name = Faker::Name.last_name
  owner_prefix = Faker::Name.prefix
  owner_age = rand(18..100)

  owner = Owner.create(first_name: owner_first_name,
                       middle_name: owner_middle_name,
                       last_name: owner_last_name,
                       prefix: owner_prefix,
                       age: owner_age)

  number_of_vehicles = rand(1..3)

  number_of_vehicles.times do
    make = Faker::Vehicle.make
    vehicle = owner.vehicles.create(vin: Faker::Vehicle.vin,
                                    make: make,
                                    model: Faker::Vehicle.model(make_of_model: make),
                                    color: Faker::Vehicle.color,
                                    transmission_type: Faker::Vehicle.transmission,
                                    year: Faker::Vehicle.year,
                                    engine_size: "V#{rand(2..4) * 2}", # Faker's engine size generator doesn't fit well here.
                                    kilometrage: Faker::Vehicle.kilometrage)
    # puts "VIN: #{vin} Make: #{make} Model: #{model} Engine Size: V#{engine_size}"

    number_of_parking_tickets = rand(0..3)

    number_of_parking_tickets.times do
      current_ticket = parking_tickets[current_ticket_index]
      ParkingTicket.create(owner: owner,
                           vehicle: vehicle,
                           ticket_number: current_ticket['ticket_number'],
                           violation: current_ticket['violation'],
                           street: current_ticket['street'],
                           latitude: current_ticket['location'] ? current_ticket['location']['latitude'] : '',
                           longitude: current_ticket['location'] ? current_ticket['location']['longitude'] : '',
                           discounted_price: current_ticket['discounted_fine'],
                           full_price: current_ticket['full_fine'],
                           issue_date: current_ticket['issue_date'])

      current_ticket_index += 1
    end
  end
end

puts "Created #{Owner.count} Owners."
puts "Created #{Vehicle.count} Vehicles."
puts "Created #{ParkingTicket.count} Parking Tickets."

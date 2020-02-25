# frozen_string_literal: true

response = HTTParty.get('https://data.winnipeg.ca/resource/bhrt-29rb.json')
parking_tickets = JSON.parse(response.body)

# uri = URI.parse('https://api.unsplash.com/search/photos?page=1&query=office&client_id=u8yaODUd2QHNIqX-Znc1D9cxAuV4UDZs3xofQzinSPI')

# response = Net::HTTP.get_response(uri)

# images = JSON.parse(response.body)

# images.inspect

Page.destroy_all
ParkingTicket.destroy_all
Vehicle.destroy_all
Owner.destroy_all

NUMBER_OF_OWNERS = 100

current_ticket_index = 0

NUMBER_OF_OWNERS.times do
  owner_first_name = Faker::Name.first_name
  owner_middle_name = Faker::Name.unique.middle_name
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

      # This ensures a parking ticket with location data is saved
      # (so maps api won't complain about null lat and long)
      if current_ticket['location']
        ParkingTicket.create(owner: owner,
                             vehicle: vehicle,
                             ticket_number: current_ticket['ticket_number'],
                             violation: current_ticket['violation'],
                             street: current_ticket['street'],
                             latitude: current_ticket['location']['latitude'],
                             longitude: current_ticket['location']['longitude'],
                             discounted_price: current_ticket['discounted_fine'],
                             full_price: current_ticket['full_fine'],
                             issue_date: current_ticket['issue_date'])
      end

      current_ticket_index += 1
    end
  end
end

Page.create(title: 'About',
            content: "The data source I'm using to populate Owner and Vehicle data is the Faker gem.
                      I'm using the vehicle library for Vehicle information and the name library for Owner information.
                      As for the ParkingTicket table, I'm pulling JSON from the Parking Ticket API on Winnipeg's open data portal
                      to populate data in the ParkingTicket table, then assigning a Vehicle and Owner foreign key to each parking ticket
                      (since a parking ticket can belong to both a Vehicle and an Owner).
                      Lastly, the Accident table will *eventually* be populated with CSV data from the US Accidents data source API.
                      This table will have a many-to-many association with the Vehicle and Owner tables
                      (since vehicles and owners can have multiple accidents, and vice versa).",
            permalink: 'about')

puts "Created #{Owner.count} Owners."
puts "Created #{Vehicle.count} Vehicles."
puts "Created #{ParkingTicket.count} Parking Tickets."
puts "Created #{Page.count} Pages."

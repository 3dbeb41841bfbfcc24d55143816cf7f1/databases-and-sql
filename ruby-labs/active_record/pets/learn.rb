require 'active_record'
require 'pg'              # or 'mysql2' or 'sqlite3'
require './owner'
require './pet'

# Connect to the Database
ActiveRecord::Base.establish_connection(
  adapter:  'postgresql', # or 'mysql2' or 'sqlite3'
  host:     'localhost',
  database: 'vet_clinic3'
  # username: 'your_username',
  # password: 'your_password'
)

puts 'List All Owners'
Owner.all.each do |owner|
  puts owner
end

puts
puts 'Listing All Pets'
Pet.all.each do |pet|
  puts pet
end

puts
puts 'Let the Pets Speak'
Pet.all.each do |pet|
  puts pet.speak
end

puts "\n" + 'Find Pet with id=1'
puts Pet.find(1)

puts "\n" + 'Find the Owner of the Pet with id=4'
puts Pet.find(4).owner
# puts Pet.includes(:owner).find(1).owner

puts "\n" + 'Find Pet with name of Miko'
puts Pet.find_by name: 'Miko'


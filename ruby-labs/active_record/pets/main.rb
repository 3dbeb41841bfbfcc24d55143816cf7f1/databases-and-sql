require_relative 'vet_clinic'

vet_clinic = VetClinic.new

puts 'List All Owners'
vet_clinic.owners.each do |owner|
  puts owner
end

puts
puts 'Listing All Pets'
vet_clinic.pets.each do |pet|
  puts pet
end

puts
puts 'Let the Pets Speak'
vet_clinic.pets.each do |pet|
  puts pet.speak
end

require 'active_record'
require 'pg'              # or 'mysql2' or 'sqlite3'
require './owner'
require './pet'

# A VetClinic for managing pets
class VetClinic
  def initialize
    # Connect to the Database
    ActiveRecord::Base.establish_connection(
      adapter:  'postgresql', # or 'mysql2' or 'sqlite3'
      host:     'localhost',
      database: 'vet_clinic3'
      # username: 'your_username',
      # password: 'your_password'
    )
  end

  def owners
    Owner.all
  end

  def pets
    Pet.all
  end

  def find_pet(id)
    Pet.find(id)
  end

  def find_owner(id)
    Owner.find(id)
  end
end

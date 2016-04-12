# An Owner of Pets
class Owner < ActiveRecord::Base
  has_many :pets
  def to_s
    pets_message = pets.map(&:name).join(',')
    "#{first_name} #{last_name} has pets: #{pets_message}."
  end
end

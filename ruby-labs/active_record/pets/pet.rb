class Pet < ActiveRecord::Base
  belongs_to :owner
  def to_s
    # "#{name} is a #{type}"
    self.inspect
  end
end

class Dog < Pet
  def speak
    "#{name} says woof woof!"
  end
end

class Bird < Pet
  def speak
    "#{name} says chirp!"
  end
end

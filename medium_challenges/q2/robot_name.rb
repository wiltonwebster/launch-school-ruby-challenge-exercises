# Robot Name

=begin
Write a program that manages robot factory settings.

When robots come off the factory floor, they have no name. The first time you
boot them up, a random name is generated, such as RX837 or BC811.

Every once in a while, we need to reset a robot to its factory settings, which 
means that their name gets wiped. The next time you ask, it will respond with a
new random name.

The names must be random; they should not follow a predictable sequence. Random 
names means there is a risk of collisions. Your solution should not allow the 
use of the same name twice.
=end

class Robot
  @@all_taken_names = []
  
  attr_reader :name
  
  def initialize
    @name = create_new_name
    @@all_taken_names << name
  end
  
  def reset
    @@all_taken_names.delete(name)
    @name = create_new_name
  end
  
  private
  
  def create_new_name
    new_name = generate_random_name
    while @@all_taken_names.include?(new_name)
      new_name = generate_random_name
    end
    new_name
  end
  
  def generate_random_name
    generated_name = ''
    2.times do
      generated_name << (65 + rand(25)).chr
    end
    3.times do 
      generated_name << rand(9).to_s
    end
    generated_name
  end
end

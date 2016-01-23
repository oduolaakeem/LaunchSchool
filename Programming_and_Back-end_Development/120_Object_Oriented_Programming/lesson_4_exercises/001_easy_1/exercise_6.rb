# What could we add to the class below to access the instance variable @volume?


class Cube
  def initialize(volume)
    @volume = volume
  end
  
  def volume
    @volume
  end
end

my_cube = Cube.new(5)
puts my_cube.volume
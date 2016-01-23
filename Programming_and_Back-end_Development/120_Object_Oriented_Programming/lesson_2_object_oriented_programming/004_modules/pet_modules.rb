

module Swim
  def swim
    "Swimming!"
  end
end

class Dog
  include Swim
end

class Fish
  include Swim
end
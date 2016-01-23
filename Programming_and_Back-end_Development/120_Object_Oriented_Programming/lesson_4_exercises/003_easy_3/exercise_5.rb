# If I have the following class:

class Television
  def self.manufacturer
    # method logic
  end 

  def model
    # method logic
  end
end

# What would happen if I called the methods like shown below?

tv = Television.new
tv.manufacturer rescue # =>NoMethodError
tv.model # =>tv model method will execute

Television.manufacturer # =>Television manufacturer class method will be executed
# Television.model rescue # =>NoMethodError
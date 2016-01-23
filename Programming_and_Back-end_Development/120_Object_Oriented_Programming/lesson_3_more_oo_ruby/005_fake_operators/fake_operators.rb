Method	  Operator	                                                 |  Description
yes     | [], []=	                                                   |  Collection element getter and setter.
yes     | **	                                                       |  Exponential operator
yes     | !, ~, +, -	                                               |  Not, complement, unary plus and minus (method names for the last two are +@ and -@)
yes     | *, /, %   	                                               |  Multiply, divide, and modulo
yes     | +, -	                                                     |  Plus, minus
yes     | >>, <<	                                                   |  Right and left shift
yes     | &	                                                         |  Bitwise "and"
yes     | ^, |	                                                     |  Bitwise inclusive "or" and regular "or"
yes     | <=, <, >, >=	                                             |  Less than/equal to, less than, greater than, greater than/equal to
yes     | <=>, ==, ===, !=, =~, !~	                                 |  Equality and pattern matching (!= and !~ cannot be directly defined)
no      | &&	                                                       |  Logical "and"
no      | ||	                                                       |  Logical "or"
no      | .., ...	                                                   |  Inclusive range, exclusive range
no      | ? :	                                                       |  Ternary if-then-else
no      | =, %=, /=, -=, +=, |=, &=, >>=, <<=, *=, &&=, ||=, **=, {	 |  Assignment (and shortcuts) and block delimiter    |   

# Examples

#*******************************************************************************************************************

# Comparison Methods

class Person
  attr_accessor :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end
  
  def >(other_person)
    age > other_person.age
  end
end

bob = Person.new("Bob", 49)
kim = Person.new("Kim", 33)

puts "bob is older than kim" if bob > kim

# ******************************************************************************

class Team
  attr_accessor :name, :members
  def initialize(name)
    @name = name
    @members = []
  end

  def <<(person)
    return if person.not_yet_18?              # suppose we had Person#not_yet_18?
    members.push person
  end
end

cowboys = Team.new("Dallas Cowboys")
emmitt = Person.new("Emmitt Smith", 46)     # suppose we're using the Person class from earlier

cowboys << emmitt                           # will this work?

cowboys.members      

# ******************************************************************************

# + method overriding

class Team
  attr_accessor :name, :members
  def initialize(name)
    @name = name
    @members = []
  end

  def <<(person)
    members.push person
  end

  def +(other_team)
    temp_team = Team.new("Temporary Team")
    temp_team.members = members + other_team.members
    temp_team
  end
end

# we'll use the same Person class from earlier

cowboys = Team.new("Dallas Cowboys")
cowboys.members << Person.new("Troy Aikman", 48)
cowboys.members << Person.new("Emmitt Smith", 46)
cowboys.members << Person.new("Michael Irvin", 49)


niners = Team.new("San Francisco 49ers")
niners.members << Person.new("Joe Montana", 59)
niners.members << Person.new("Jerry Rice", 52)
niners.members << Person.new("Deion Sanders", 47)

# ******************************************************************************

# Element setter and getter methods

class Team
  attr_accessor :name, :members
  def initialize(name)
    @name = name
    @members = []
  end

  def <<(person)
    members.push person
  end

  def +(other_team)
    temp_team = Team.new("Temporary Team")
    temp_team.members = members + other_team.members
    temp_team
  end
  
  def [](idx)
    members[idx]
  end

  def []=(idx, obj)
    members[idx] = obj
  end
end

# we'll use the same Person class from earlier

cowboys = Team.new("Dallas Cowboys")
cowboys.members << Person.new("Troy Aikman", 48)
cowboys.members << Person.new("Emmitt Smith", 46)
cowboys.members << Person.new("Michael Irvin", 49)


niners = Team.new("San Francisco 49ers")
niners.members << Person.new("Joe Montana", 59)
niners.members << Person.new("Jerry Rice", 52)
niners.members << Person.new("Deion Sanders", 47)
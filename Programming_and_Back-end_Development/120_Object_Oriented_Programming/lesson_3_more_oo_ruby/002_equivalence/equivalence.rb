str1 = "something"
str2 = "something"
str1 == str2            # => true

int1 = 1
int2 = 1
int1 == int2            # => true

sym1 = :something
sym2 = :something
sym1 == sym2  

# ****************************************************************

str1 = str1 + " else"
str1                    # => "something else"

str1 == str2            # => false

# ****************************************************************

str1 = "something"
str2 = "something"
str1_copy = str1

# comparing the string objects' values
str1 == str2            # => true
str1 == str1_copy       # => true
str2 == str1_copy       # => true

# comparing the actual objects
str1.equal? str2        # => false
str1.equal? str1_copy   # => true
str2.equal? str1_copy   # => false


# ****************************************************************


class Person
  attr_accessor :name
  
  def ==(other)
    name == other.name
  end
end

bob = Person.new
bob.name = "bob"

bob2 = Person.new
bob2.name = "bob"

bob == bob2                # => false

bob_copy = bob
bob == bob_copy            # => true

# ****************************************************************

# ===

# There are two more concepts related to equality. The first is the === method. Just like ==, it looks like a built-in Ruby opertor when you use it, but it's in fact an instance method. The more confusing part about this method is that it's used implicitly by the case statement.

# A good example of seeing === in action is when we have ranges in a when clause.
class Person
  def initialize
    @heroes = ['Superman', 'Spiderman', 'Batman']
    @cash = {'ones' => 12, 'fives' => 2, 'tens' => 0, 'twenties' => 2, 'hundreds' => 0}
  end

  def cash_on_hand
    total = 0.0
    @cash.each do |bill_face, qty|
      case bill_face
      when 'ones'
        total += 1 * qty
      when 'fives'
        total += 5 * qty
      when 'tens'
        total += 10 * qty
      when 'twenties'
        total += 20 * qty
      when 'hundreds'
        total += 100 * qty
      end
    end
    "$#{total}"
  end

  def heroes
    @heroes.join(', ')
  end
end

joe = Person.new
puts joe.cash_on_hand            # => "$62.00"
puts joe.heroes                  # => "Superman, Spiderman, Batman"
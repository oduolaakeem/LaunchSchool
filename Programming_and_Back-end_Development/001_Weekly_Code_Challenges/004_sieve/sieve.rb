class Sieve
  attr_reader :limit
  
  def initialize(number)
    @limit = number
  end
  
  def primes
    @primes = {}
    (2..limit).each { |num| @primes[num] = true }
    (2..limit).each do |num|
      (num..limit).each { |inner_num| inner_num * num <= limit ? @primes[inner_num * num] = false : break}
    end
    @primes.select { |_, value| value }.keys
  end
end
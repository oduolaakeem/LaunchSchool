class Series
  def initialize(string)
    @digits = string
  end
  
  def slices(length)
    raise ArgumentError unless length <= @digits.size
    series = []
    (0..(@digits.size - length)).each do |start_index|
      serie = []
      (start_index..(start_index + length - 1)).each { |index| serie << @digits[index].to_i }
      series << serie
    end
    series
  end
end
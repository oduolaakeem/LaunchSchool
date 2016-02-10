class CircularBuffer
  def initialize(size)
    @buffer = []
    @size = size
  end

  def read
    @buffer.empty? ? fail(BufferEmptyException.new) : @buffer.shift
  end

  def write(value)
    return unless value
    @buffer.size == @size ? fail(BufferFullException.new) : @buffer << value
  end

  def write!(value)
    return unless value
    if @buffer.size == @size
      @buffer.shift
      @buffer << value
    else
      write(value)
    end
  end

  def clear
    @buffer = []
  end

  class BufferEmptyException < Exception
  end

  class BufferFullException < Exception
  end
end

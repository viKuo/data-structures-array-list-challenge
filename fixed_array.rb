class FixedArray
  def initialize(size = 16)
    @array = Array.new(size, nil)
  end

  def size
    @array.length
  end

  def get(index)
    raise IndexOutOfBoundsError if index >= self.size || index < 0
    @array[index]
  end

  def set(index, value)
    raise IndexOutOfBoundsError if index >= self.size || index < 0
    @array[index] = value
  end
end

class IndexOutOfBoundsError < StandardError; end

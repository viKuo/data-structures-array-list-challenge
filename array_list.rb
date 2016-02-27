require './fixed_array'

class ArrayList
  attr_reader :length

  def initialize(initialCapacity = 16)
    @initialCapacity = initialCapacity
    @array = FixedArray.new(@initialCapacity)
    @length = 0
  end

  def add(object)
    grow_array if fixed_array_full?
    @array.set(length, object)
    @length += 1
    object
  end

  def get(index)
    raise IndexOutOfBoundsError if index >= self.length || index < 0
    @array.get(index)
  end

  def set(index, object)
    raise IndexOutOfBoundsError if index >= self.length || index < 0
    @array.set(index, object)
  end

  def insert(index, object)
    raise IndexOutOfBoundsError if index > self.length || index < 0
    grow_array if fixed_array_full?

    shift_contents_right_from(index)
    @array.set(index, object)
    @length += 1
    object
  end

  private

  def grow_array
    new_array = FixedArray.new(@initialCapacity * 2)
    0.upto(@length - 1) do |i|
      new_array.set(i, @array.get(i))
    end
    @array = new_array
  end

  def fixed_array_full?
    @array.size == @length
  end

  def shift_contents_right_from(index)
    (@length - 1).downto(index) do |i|
      @array.set(i + 1, @array.get(i))
    end
  end
end

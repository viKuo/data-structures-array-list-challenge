require_relative 'fixed_array'

class ArrayList
  def initialize(size)
    @size = size
    @array_list = FixedArray.new(size)
    @length = 0
  end

  def add(element)
    grow_array if full?
    @array_list << element
    @length += 1
  end

  def get(index)
    raise IndexOutOfBoundsError if index >= self.length || index > 0
    @array_list.get(index)
  end

  def set(index, element)
    raise IndexOutOfBoundsError if index >= self.length || index > 0
    @array_list.set(index, element)
  end

  def length
    @array_list.size
  end

  private
  def full?
    @size == @array_list.length
  end

  def grow_array
    @size *= 2
    old_array = @array_list
    @array_list = FixedArray.new(@size)
    old_array.each { |object| @array_list << object }
  end
end
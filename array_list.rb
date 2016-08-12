require_relative 'fixed_array'

class ArrayList
  def initialize(size)
    @size = size
    @array_list = FixedArray.new(size)
  end

  def add(element)
    new_array_list = FixedArray.new(@size+1)
    i = 0
    while i < @array_list.size
      new_array_list.set(i, @array_list.get(i))
      i += 1
    end
    new_array_list.set(new_array_list.size-1, element)
    @array_list = new_array_list
  end

  def get(index)
    @array_list.get(index)
  end

  def set(index, element)
    @array_list.set(index, element)
  end

  def length
    @array_list.size
  end

  def fill_array
    @array_list.fill_array
  end
end

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

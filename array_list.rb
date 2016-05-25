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

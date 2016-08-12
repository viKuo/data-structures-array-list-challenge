require_relative 'array_list'

describe ArrayList do
  let(:list) { ArrayList.new }

  describe "#new" do
    it "instantiates a new dynamic list with initial capacity of 16" do
      expect(FixedArray).to receive(:new).with(16)
      ArrayList.new
    end

    it "instantiates a new dynamic list with a specified initial capacity" do
      initialCapacity = 32
      expect(FixedArray).to receive(:new).with(initialCapacity)
      ArrayList.new(initialCapacity)
    end
  end

  describe "#add" do
    it "adds the element to the list" do
      expect { list.add(double(:object)) }.to change { list.length }.by(1)
    end

    it "returns the object that was added" do
      object = double(:object)
      expect(list.add(object)).to eq object
    end

    it "adds more space when needed" do
      list = ArrayList.new(16)
      16.times do
        list.add(double(:object))
      end
      expect { list.add(double(:new_object)) }.not_to raise_error
    end
  end

  describe "#get" do
    it "returns the element at the specified index in the list" do
      object = double(:object)
      list.add(object)
      expect(list.get(0)).to eq object
    end

    it "raises OutOFBoundsException if specified position is less than zero" do
      expect { list.get(-1) }.to raise_error(IndexOutOfBoundsError)
    end

    it "raises OutOFBoundsException if specified position is greater than or equal to size" do
      expect { list.get(0) }.to raise_error(IndexOutOfBoundsError)
    end
  end

  describe "#set" do
    let(:original_object)    { double(:original_object) }
    let(:replacement_object) { double(:replacement_object) }

    before do
      list.add(original_object)
    end

    it "replaces the element at the specified index with the specified element" do
      expect { list.set(0, replacement_object) }.to change { list.get(0) }.from(original_object).to(replacement_object)
    end

    it "returns the replacement element" do
      expect(list.set(0, replacement_object)).to eq replacement_object
    end

    it "raises OutOFBoundsException if specified position is less than zero" do
      expect { list.set(-1, replacement_object) }.to raise_error(IndexOutOfBoundsError)
    end

    it "raises OutOFBoundsException if specified position is greater than or equal to size" do
      expect { list.set(list.length, replacement_object) }.to raise_error(IndexOutOfBoundsError)
    end
  end

  describe "#length" do
    it "returns 0 for an empty list" do
      list = ArrayList.new
      expect(list.length).to eq 0
    end

    it "returns the number of elements in the list" do
      5.times do
        list.add(double(:object))
      end
      expect(list.length).to eq 5
    end
  end

  describe "#insert" do
    let(:first_object)  { double(:first_object) }
    let(:middle_object) { double(:middle_object) }
    let(:last_object)   { double(:last_object) }

    before do
      list.add(first_object)
      list.add(last_object)
    end

    it "inserts the specified element at the specified position in this list" do
      expect { list.insert(1, middle_object) }.to change { list.get(1) }.from(last_object).to(middle_object)
    end

    it "shift all proceeding elements in the list down by 1 position" do
      expect { list.insert(1, middle_object) }.not_to change { list.get(list.length - 1) }
    end

    it "returns the inserted element" do
      expect(list.insert(1, middle_object)).to eq middle_object
    end

    it "increments length by 1" do
      expect { list.insert(1, middle_object) }.to change { list.length }.by(1)
    end

    it "raises OutOFBoundsException if specified position is less than zero" do
      expect { list.insert(-1, middle_object) }.to raise_error(IndexOutOfBoundsError)
    end

    it "raises OutOFBoundsException if specified position is greater than size" do
      expect { list.insert(list.length + 1, middle_object) }.to raise_error(IndexOutOfBoundsError)
    end

    it "adds more space when needed" do
      list = ArrayList.new(16)
      16.times do
        list.add(double(:object))
      end
      expect { list.insert(0, double(:new_object)) }.not_to raise_error
    end
  end
end

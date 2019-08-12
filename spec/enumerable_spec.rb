require './Enumerable'

describe Enumerable do
  let(:array){[1,2,3,4]}
  describe "#my_each" do
    it "should loop through an array by giving the elements in it" do
      new_array = []
      array.my_each{ |x| new_array.push(x*2) }
      expect(new_array).to eq( [2,4,6,8] )
    end
  end

  describe "#my_each_with_index" do
    it "should loop through the array by the giving the elements and their index" do
      new_array = []
      array.my_each_with_index{ |e, i| new_array.push([e, i] ) }
      expect(new_array).to eq( [ [1,0], [2,1], [3,2], [4,3] ] )
    end
  end

  describe "#my_select" do
    it "should loop through the array by and return elements that pass a condition" do
      new_array = array.my_select{ |x| x%2==0}
      expect(new_array).to eq( [2, 4] )
    end
  end

  describe "#my_all?" do
    it "should loop through the array and determine if all the elements are true" do
      expect(array.my_all?).to eq(true)
      expect( [false, 0].my_all?).to eq(false)
    end
  end

  describe "#my_any?" do
    it "should loop through the array and determine if any element is true" do
      expect(array.my_any?).to eq(true)
      expect( [false, 1].my_any?).to eq(true)
      expect( [false, false, nil].my_any?).to eq(false)
    end
  end

  describe "#my_none?" do
    it "should loop through the array and determine if no element is true" do
      expect(array.my_none?).to eq(false)
      expect([false, 1].my_none?).to eq(false)
      expect([false, false, nil].my_none?).to eq(true)
    end
  end

  describe "#my_count" do
    it "should loop through the array and count the number of elements that match a condition" do
      expect(array.my_count{ |x| x%2==0}).to eq(2)
      expect(array.my_count{ |x| x > 4}).to eq(0)
    end
  end

  describe "#my_map" do
    it "should loop through the array and determine if any element is true" do
      expect(array.my_map{ |x| x*2} ).to eq( [2,4,6,8] )
    end
  end

  describe "#my_inject" do
    it "should loop through the array and perform arithmetic operations on all the elements" do
      expect(array.my_inject{ |x, y| x+y} ).to eq(10)
    end
  end
end

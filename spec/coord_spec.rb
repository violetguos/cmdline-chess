require './lib/coord.rb'

describe Arr2D do
  it "finds an object in a 2d array" do
    b = Arr2D.new(8)
    loc = Coord2D.new(2, 1)
    b[loc] = "test"
    expect(b[loc]).to eql("test")    
  end

  it "returns an error when coordinates are out of boundary" do
    b = Arr2D.new(4)
    loc = Coord2D.new(5, 6)
    expect{b[loc]}.to raise_error(RuntimeError, 'Coord out of boundary')
  end


  it "performs arithmetic" do 
    loc = Coord2D.new(2, 1)
    dest = Coord2D.new(1, 1)
    res = loc + dest
    expect(res).to eql(Coord2D.new(3, 2))
  end

  it "overloads comparision" do 
    loc = Coord2D.new(2, 1)
    dest = Coord2D.new(2, 1)
    eval = (loc == dest)
    expect(eval).to eql(true)
  end
end
  
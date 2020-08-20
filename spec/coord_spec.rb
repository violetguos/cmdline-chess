require './lib/coord.rb'

describe Arr2D do
  it "finds an object in a 2d array" do
    b = Arr2D.new(8)
    loc = Coord2D.new(2, 1)
    b[loc.x, loc.y] = "test"
    expect(b[loc.x, loc.y]).to eql("test")    
  end

  it "looks up and sets row vals given a 2D coord" do
    b = Arr2D.new(3)
    loc = Coord2D.new(2, 1)
    b.set_row(loc, [1, 2, 3])
    b.p
    expect(b.get_row(loc)).to eql([1, 2, 3])
  end

  it "looks up and sets row vals given a 2D coord" do
    b = Arr2D.new(3)
    loc = Coord2D.new(2, 1)
    b.set_col(loc, [1, 2, 3])
    b.p
    expect(b.get_col(loc)).to eql([1, 2, 3])
  end
end
  
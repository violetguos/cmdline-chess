require './lib/coord.rb'

describe Arr2D do
  it "finds an object in a 2d array" do
    b = Arr2D.new(8)
    loc = Coord2D.new(2, 1)
    b[loc.x, loc.y] = "test"
    expect(b[loc.x, loc.y]).to eql("test")    
  end
end
  
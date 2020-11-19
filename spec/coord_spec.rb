require './lib/coord.rb'

describe Arr2D do
  it "finds an object in a 2d array" do
    b = Arr2D.new(8)
    loc = Coord2D.new(2, 1)
    b[loc.x, loc.y] = "test"
    expect(b[loc.x, loc.y]).to eql("test")    
  end

  it "looks up the diags and return 2 arrays of Struct Coord2D" do
    b = Arr2D.new(3)
    b[0, 0] = 0
    b[1, 1] = 1
    b[2, 2] = 2

    b[2, 0] = 2
    b[1, 1] = 1
    b[0, 2] = 0
    # NOTE: it's not a list of 2 lists, only required for rspec syntax
    expect(b.get_diag).to eql([[2, 1, 0], [0, 1, 2]])
  end

  it "performs arithmetic" do 
    loc = Coord2D.new(2, 1)
    dest = Coord2D.new(1, 1)
    res = loc + dest
    expect(res).to eql(Coord2D.new(3, 2))
  end
end
  
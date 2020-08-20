Coord2D = Struct.new(:x, :y)

class Arr2D
  # define a 2d coordinate system independent of chess
  attr_accessor :dim, :array_2d

  def initialize(dim)

    @dim = dim
    @array_2d = Array.new(@dim){Array.new(@dim)}

  end
  def find(obj)
    # find a given obj's location
    @array_2d.each_with_index do |subarray, i|
      j = subarray.index(obj)
      return Coord2D(i, j) if j
    end
    nil

  end

  def [](x, y)
    #coordinate look up with []
    #return @board[coord.x][coord.y]
    @array_2d[x][y]
  end

  def []=(x, y, val)
    #coordinate set to val with []
    # @board[coord.x][coord.y] = val
    @array_2d[x][y] = val
  end

  
end
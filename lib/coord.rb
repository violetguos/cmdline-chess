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

  def get_row(loc)
    # look up a row directly from the 2D coordinate
    @array_2d[loc.x]
  end

  def set_row(loc, val)
    @array_2d[loc.x] = val
  end

  def get_col(loc)
    arr = []
    @array_2d.each_with_index do |subarr, i|
      arr.push(subarr[loc.y])
    end
    arr
  end

  def set_col(loc, val)
    # set column to value array
    # assume val has the same dim as array_2d's column
    @array_2d.each_with_index do |subarr, i|
      subarr[loc.y] = val[i]
    end
  end

  def diag(loc)
		raise NotImplementedError.new("You must implement #{__method__}.")
  end

  def p
    for i in 0...@dim
      for j in 0...@dim
        if !@array_2d[i][j]
          print "_"
        else
          print @array_2d[i][j]
        end
        print "|"
      end
      print "\n"
    end
  end
  
end
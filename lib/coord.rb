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
      return Coord2D.new(i, j) if j
    end
    nil

  end

  def [](x, y)
    #coordinate look up with []
    #return @board[coord.x][coord.y]
    raise "Coord out of boundary" unless (x>= 0 && x<@dim && y>=0 && y<@dim)
    @array_2d[x][y]
  end

  def []=(x, y, val)
    #coordinate set to val with []
    # @board[coord.x][coord.y] = val
    raise "Coord out of boundary" unless (x>= 0 && x<@dim && y>=0 && y<@dim)
    @array_2d[x][y] = val
  end

  def get_row(loc)
    # look up a row directly from the 2D coordinate
    row = []
    for i in 0...@dim do
      row.append(Coord2D.new(loc.x, i))
    end
    row
  end

  def set_row(loc, val)
    @array_2d[loc.x] = val
  end

  def get_col(loc)
    arr = []
    @array_2d.each_with_index do |subarr, i|
      arr.push(Coord2D.new(i, loc.y))
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

  def get_diag
    ## get diagonals
    diag_l_r = [] # \ dir
    diag_r_l = [] # / dir

    # direction \, up
    x = @dim - 1
    y = @dim - 1
    while x >= 0 && y >= 0
      diag_r_l.push(@array_2d[x][y])
      x -= 1
      y -= 1
    end

    # direction /, up
    x = 0
    y = @dim - 1
    while x < @dim && y >= 0
      diag_l_r.push(@array_2d[x][y])
      x += 1
      y -= 1
    end
    return diag_r_l, diag_l_r
  end

  def p(unicode=false)
    for i in 0...@dim
      for j in 0...@dim
        if !@array_2d[i][j]
          print "_"
        else
          if !unicode
            print @array_2d[i][j]
          else
            print @array_2d[i][j].unicode.encode('utf-8')
          end
        end
        print "|"
      end
      print "\n"
    end
  end
  
end
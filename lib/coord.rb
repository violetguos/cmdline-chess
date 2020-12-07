Coord2D = Struct.new(:x, :y) do
  def +(other)
    Coord2D.new(x + other.x, y + other.y)
  end

  def -(other)
    Coord2D.new(x - other.x, y - other.y)
  end

  def ==(other)
    x == other.x && y == other.y ? true : false
  end
end

class Arr2D
  # define a 2d coordinate system independent of chess
  attr_accessor :dim, :array_2d

  def initialize(dim)
    @dim = dim
    @array_2d = Array.new(@dim) { Array.new(@dim) }
  end

  def find(obj)
    # find a given obj's location
    @array_2d.each_with_index do |subarray, i|
      j = subarray.index(obj)
      return Coord2D.new(i, j) if j
    end
    nil
  end

  def is_available?(coord)
    @array_2d[coord].nil? ? true : false
  end

  def [](coord)
    # coordinate look up with []
    # return @board[coord.x][coord.y]

    raise 'Coord out of boundary' unless coord.x >= 0 && coord.x < @dim && coord.y >= 0 && coord.y < @dim

    @array_2d[coord.x][coord.y]
  end

  def []=(coord, val)
    # coordinate set to val with []
    # @board[coord.x][coord.y] = val
    raise 'Coord out of boundary' unless coord.x >= 0 && coord.x < @dim && coord.y >= 0 && coord.y < @dim

    @array_2d[coord.x][coord.y] = val
  end

  def each
    @array_2d.each do |arr|
      arr.each do |value|
        yield value
      end
    end
  end

  def diag
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
    [diag_r_l, diag_l_r]
  end

  def p
    (0...@dim).each do |i|
      (0...@dim).each do |j|
        if !@array_2d[i][j]
          print '_'
        else
          if !@array_2d[i][j].unicode
            print @array_2d[i][j]
          else
            print @array_2d[i][j].unicode.encode('utf-8')
          end
        end

        print '|'
      end
      # chess board convention
      print "#{8 - i}\n"
    end

    (0...@dim).each do |i|
      rank = i + 'a'.ord
      rank = rank.chr
      print "#{rank}|"
    end
    print "\n"
  end
end

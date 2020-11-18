Coord2D = Struct.new(:x, :y)

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

  def [](x, y)
    # coordinate look up with []
    # return @board[coord.x][coord.y]
    raise 'Coord out of boundary' unless x >= 0 && x < @dim && y >= 0 && y < @dim

    @array_2d[x][y]
  end

  def []=(x, y, val)
    # coordinate set to val with []
    # @board[coord.x][coord.y] = val
    raise 'Coord out of boundary' unless x >= 0 && x < @dim && y >= 0 && y < @dim

    @array_2d[x][y] = val
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
      rank = i + 'a'.ord
      rank = rank.chr
      print "#{rank}\n"
    end

    (0...@dim).each do |i|
      print "#{i + 1}|"
    end
    print "\n"
  end
end

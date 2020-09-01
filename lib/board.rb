require_relative 'coord.rb'
require_relative 'pieces/pawn.rb'

class Board 
  attr_reader :array2d
  def initialize
    @array2d = Arr2D.new(8)
    pawn = Pawn.new('pawn', "\u2659", 'W')
    @array2d[1, 0] = pawn
    @array2d.p(unicode=true)
  end

  def move(loc)
    # check piece is still there
    # check legal destination
    # set @array2d[loc.x, loc.y] =>
    
  end


end

b = Board.new
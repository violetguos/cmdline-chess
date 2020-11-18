require_relative 'coord.rb'
require_relative 'pieces/pawn.rb'
require_relative 'pieces/rook.rb'
require_relative 'constants.rb'
class Board 
  attr_reader :array2d
  def initialize
    @array2d = Arr2D.new(8)
    pawn = Pawn.new('pawn', "\u2659", W)
    @array2d[1, 0] = pawn
    rook = Rook.new('rook', "R", W)
    @array2d[0, 0] = rook
    @array2d.p
    
  end

  def move(piece)
 
    
  end


end

b = Board.new
# b.move(b.array2d[1, 0])
b.move(b.array2d[0, 0])

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
    @array2d.p(unicode=true)
    
  end

  def move(piece)
    if piece.class == Rook
      p @array2d.get_col(@array2d.find(piece))
      p @array2d.get_row(@array2d.find(piece))
    end
    
  end


end

b = Board.new
b.move(b.array2d[0, 0])
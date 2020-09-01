require_relative 'coord.rb'
require_relative 'pieces/pawn.rb'

class Board 
  attr_accessor :array2d
  def initialize
    @array2d = Arr2D.new(8)
    pawn = Pawn.new('pawn', "\u2659", 1, 'W')
    @array2d[1, 0] = pawn
    @array2d.p(unicode=true)
  end


end

b = Board.new
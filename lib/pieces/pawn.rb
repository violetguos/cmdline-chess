require_relative 'piece.rb'
require_relative '../constants.rb'
require_relative '../coord.rb'

class Pawn < Piece

  def forward
    mult = -1
    @player == W ? mult : 1
  end

end

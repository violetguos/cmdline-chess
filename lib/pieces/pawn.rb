require_relative 'piece.rb'
require_relative '../constants.rb'
require_relative '../coord.rb'

class Pawn < Piece
  attr_accessor :first_move
  
  def forward
    mult = -1
    @player == W ? mult : 1
  end

  def first_move
    step = Coord2D.new(0, 2)
    step.x *= self.forward
    step
  end

  def usual_move
    step = Coord2D.new(0, 1)
    step.x *= self.forward
    step
  end

  def move_ovetake

  end




end


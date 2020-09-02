require_relative 'piece.rb'
require_relative '../constants.rb'
require_relative '../coord.rb'

class Pawn < Piece
  attr_accessor :first_move
  
  def forward
    mult = -1
    @player == W ? mult : 1
  end

  def move
    # forward
    #first move
    # usual move
    # move while overtaking
    if !@moved
      step = Coord2D.new(1, 2)
    else 
      step = Coord2D.new(1, 1)
    end
    
    step.x *= self.forward
    step
  end




end


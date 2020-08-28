require_relative 'piece.rb'

class Pawn < Piece
  def forward(loc)
    if @player == "W"
      loc+=1
    else
      loc -=1
    end
    loc
  end

  def first_move(curr)
    # not tested
    # if curr.x == 1 && @player == "W"
    #   @legal_moves.push([2+curr[0], curr[1]])
    # elsif curr.x == 6 && @player == "B"
    #   @legal_moves.push([-2+curr[0], curr[1]])
    
  end

  def avg_one_move()
    # not tested
    
  end

  def taking(curr)
    # not tested, and pseudo
    # 

  end


end
require_relative 'constants.rb'

module Rules
  def Rules.pawn(pawn, curr, target)
    if !pawn.moved && target.x - curr.x == pawn.forward * 2 && curr.y == target.y
      return true
    elsif !pawn.moved && target.x - curr.x == pawn.forward * 1 && curr.y == target.y
      return true
    elsif pawn.moved && target.x - curr.x == pawn.forward * 1 && curr.y == target.y
      return true
    end
    false
  end

  def Rules.knight(knight, curr, target)
    # verify the L shape
    #if curr.x - target.x == 2 
  end


end

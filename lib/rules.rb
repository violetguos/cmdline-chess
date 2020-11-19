require_relative 'constants.rb'
require_relative 'coord.rb'
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
    legit = false
    moves = [Coord2D.new(2, 1), Coord2D.new(2, -1), Coord2D.new(-2, 1), Coord2D.new(-2, -1),
      Coord2D.new(1, 2), Coord2D.new(1, -2), Coord2D.new(-1, -2), Coord2D.new(-1, 2)
    ]
    moves.each do |m|
      legit = true if m + curr == target
    end
    legit
  end


end

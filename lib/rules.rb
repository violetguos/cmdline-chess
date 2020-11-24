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

  def Rules.rook(rook, curr, target)
    legit = false
    if target.x == curr.x || target.y == target.y
      legit = true
    end
    legit   
  end

  def Rules.no_jump(board, curr, target)
    legit = false 
    if target.x == curr.x
      if target.y > curr.y
        dest = curr.y
        loop do
          dest += 1         
          legit = board[target.x, dest] == nil ? true : false
        break if !legit || dest >= target.y 
        end
      end

      if target.y < curr.y
        dest = curr.y
        loop do
          dest -= 1
          legit = board[target.x, dest] == nil ? true : false
        break if !legit || dest <= target.y
        end
      end
    end
    legit
  end


end

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

  def Rules.knight(curr, target)
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

  def Rules.rook(board, curr, target)
    legit = false
    legit_moves = Rules.no_jump(board, curr, target)
    legit_moves.each do |move|
      legit = true if move == target
    end  
    legit
  end

  def Rules.no_jump(board, curr, target)
    # x controls which row
    legit_moves = [] 
    directions = [[1, 0], [-1,0], [-1, 0], [0, -1]]
    directions.each do |direction|
      new_file = curr.x + direction[0]
      new_rank = curr.y + direction[1]
      while curr.x.between?(0, 8) && curr.y.between?(0, 8) && board[curr.x, curr.y] == nil
        legit << Coord2D.new(new_file, new_file)

      end
    end

    
    legit_moves
  end

end

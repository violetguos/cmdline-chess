

class Piece
  attr_accessor :name, :legal_moves
  def initialize(name, legal_moves)
    @name = name
    @legal_moves = legal_moves
    
  end

  def check_move(destination)
    true
  end

end # class

R = Piece.new("R", "todo")
N = Piece.new("N", "todo")
B = Piece.new("B", "todo")
K = Piece.new("K", "todo")
Q = Piece.new("Q", "todo")

P = Piece.new("P", "todo")



class Board
  def initialize
    @dim = 8
    @board_config = Array.new(@dim){Array.new(@dim)}
    board_start
  end

  def board_start
    # fill the board with pieces
    # rook
    @board_config[0][0] = R
    @board_config[0][1] = N 
    @board_config[0][2] = B
    @board_config[0][3] = K
    @board_config[0][4] = Q
    @board_config[0][5] = B
    @board_config[0][6] = N
    @board_config[0][7] = R

    @board_config[@dim-1][0] = R
    @board_config[@dim-1][1] = N 
    @board_config[@dim-1][2] = B
    @board_config[@dim-1][3] = K
    @board_config[@dim-1][4] = Q
    @board_config[@dim-1][5] = B
    @board_config[@dim-1][6] = N
    @board_config[@dim-1][7] = R

    # pawns
    for i in 0...@dim
      @board_config[1][i] = P
      @board_config[@dim-2][i] = P
    end
  end #board_start

  def print_b
    for i in 0...@dim
      for j in 0...@dim
        if !@board_config[i][j]
          print "_"
        else
          print @board_config[i][j].name
        end
        print "|"
      end
      print "\n"
    end
  end #print b

  def move(piece, destination)
    if piece.check_move(destination)

      @board_config[destination[0]][destination[1]] = piece
      #@board_config[piece.position]
    end
  end

end

b = Board.new
b.print_b
puts 
b.move(Q, [3, 2])
b.print_b
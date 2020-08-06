require_relative 'piece'

class Board
  attr_accessor :board_config, :pieces
  def initialize

    @dim = 8
    @board_config = Array.new(@dim){Array.new(@dim)}

    @pieces = White::pieces()
    #p @pieces
    board_start
  end

  def board_start
    # fill the board with pieces
    # rook
    @board_config[0][0] = @pieces[:rook][0]
    @board_config[0][1] = @pieces[:knight][0]
    @board_config[0][2] = @pieces[:bishop][0]
    @board_config[0][3] = @pieces[:king][0]
    @board_config[0][4] = @pieces[:queen][0]
    @board_config[0][5] = @pieces[:bishop][1] 
    @board_config[0][6] = @pieces[:knight][1]
    @board_config[0][7] = @pieces[:rook][1]

    # @board_config[@dim-1][0] = @pieces[:rook]
    # @board_config[@dim-1][1] = @pieces[:knight]
    # @board_config[@dim-1][2] = @pieces[:bishop]
    # @board_config[@dim-1][3] = @pieces[:king]
    # @board_config[@dim-1][4] = @pieces[:queen]
    # @board_config[@dim-1][5] = @pieces[:bishop] 
    # @board_config[@dim-1][6] = @pieces[:knight]
    # @board_config[@dim-1][7] = @pieces[:rook] 

    # pawns
    for i in 0...@dim
      @board_config[1][i] = @pieces[:pawn][i]
      @board_config[@dim-2][i] = @pieces[:pawn][i] 
    end
  end #board_start

  def print_b
    for i in 0...@dim
      for j in 0...@dim
        if !@board_config[i][j]
          print "_"
        else
          print @board_config[i][j].unicode
        end
        print "|"
      end
      print "\n"
    end
  end #print b

  def find(piece)

    @board_config.each_with_index do |subarray, i|

      j = subarray.index(piece)
      return [i, j] if j
    end
    nil
  end

  def reset(loc)

    if @board_config && @board_config[loc[0]]
      @board_config[loc[0]][loc[1]] = nil
    end
  end

  def move(piece, destination)
    if piece.check_move(destination)
      prev_loc = find(piece)
      @board_config[destination[0]][destination[1]] = piece
      reset(prev_loc)
    end
  end

end

b = Board.new
b.print_b
puts 
b.move(b.pieces[:queen][0], [3, 2])
b.print_b
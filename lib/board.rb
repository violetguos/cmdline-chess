require_relative 'piece'

class Board
  attr_accessor :board_config, :white_pieces, :black_pieces
  def initialize

    @dim = 8
    @board_config = Array.new(@dim){Array.new(@dim)}

    @white_pieces = White::pieces()
    @black_pieces = Black::pieces()
    #p @pieces
    board_start
  end

  def half_board_start(pieces, start_idx)
    @board_config[start_idx][0] = pieces[:rook][0]
    @board_config[start_idx][1] = pieces[:knight][0]
    @board_config[start_idx][2] = pieces[:bishop][0]
    @board_config[start_idx][3] = pieces[:king][0]
    @board_config[start_idx][4] = pieces[:queen][0]
    @board_config[start_idx][5] = pieces[:bishop][1] 
    @board_config[start_idx][6] = pieces[:knight][1]
    @board_config[start_idx][7] = pieces[:rook][1]

    # pawns
    if start_idx == 0
      pawn_idx = start_idx + 1
    else
      pawn_idx = start_idx - 1
    end
    for i in 0...@dim
      @board_config[pawn_idx][i] = pieces[:pawn][i]
    end
  end

  def board_start
    # fill the board with pieces
    half_board_start(@white_pieces, 0)
    half_board_start(@black_pieces, @dim-1)

    
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
b.move(b.white_pieces[:queen][0], [3, 2])
b.move(b.black_pieces[:queen][0], [2, 2])

b.print_b

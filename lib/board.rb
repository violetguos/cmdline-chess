require_relative 'piece'

class Board
  attr_accessor :board_config, :white_pieces, :black_pieces
  def initialize

    @dim = 8
    @board_config = Array.new(@dim){Array.new(@dim)}

    @white_pieces = White::pieces()
    @black_pieces = Black::pieces()
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
    prev_loc = find(piece)

    if piece.check_move(prev_loc, destination)
      @board_config[destination[0]][destination[1]] = piece
      reset(prev_loc)
    else
      puts "Illegal move"
    end
  end

  def check_new_loc(x, y, legal_moves)
    # check if [x ,y] is legal
    legal_moves.each_with_index do |move, i|
      if  move[0] == x &&  move[1] == y
        return true 
      end
    end
    false
  end

  def visual_legal_moves(piece)
    piece.legal_moves = piece.all_possible_moves(find(piece))
    destinations = []
    curr = find(piece)

    for i in 0...@dim
      for j in 0...@dim
        if check_new_loc(i, j, piece.legal_moves)
          print piece.unicode
        else
            print "_"
        end

        print "|"
      end
      print "\n"
    end
  end

  def check_occupancy(loc)
    if @board_config[loc[0]][loc[1]] != nil
      return true
    else 
      return false
    end
  end

  def random_move
    # random piece, random move
    rand_piece = @black_pieces[@black_pieces.keys.sample][0]
    curr_loc = find(rand_piece)
    rand_piece.legal_moves = rand_piece.all_possible_moves(curr_loc)
    dest = nil
    loop do
      dest = rand_piece.legal_moves.sample
      break if !check_occupancy(dest)
    end
    move(rand_piece, dest)
  end

  def overtake(row, col)
    if @board_config[row][col]
      piece = @board_config[row][col]
      # TODO check score
      reset([row, col])
    end
  end

end


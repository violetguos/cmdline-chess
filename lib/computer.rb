require_relative 'piece'

class Computer
  def initalize
    @available_pieces
    @board
  end

  def update_pieces(board)
    @available_pieces = []
    board.each do |piece|
      if piece
        if piece.player == Player::B
          @available_pieces.push(piece)
        end
      end
    end
  end

  def choose_random_piece(board)
    piece = @available_pieces.sample
    dest = piece.possible_moves(board, piece.position).sample
    while !dest 
      piece = @available_pieces.sample
      dest = piece.possible_moves(board, piece.position).sample
    end
    return piece, dest
  end
  
end


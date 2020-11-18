require_relative 'pieces/pawn.rb'
require_relative 'pieces/rook.rb'
require_relative 'pieces/piece.rb'
require_relative 'constants.rb'

def init(board)
  row_pawn_white = 6
  row_other_white = 7
  rook = Rook.new('rook', "\u2656", W)
  board[row_other_white, 0] = rook

  rook = Rook.new('rook', "\u2656", W)
  board[row_other_white, 7] = rook

  knight = Piece.new('knight', "\u2658", W)
  board[row_other_white, 1] = knight

  knight = Piece.new('knight', "\u2658", W)
  board[row_other_white, 6] = knight

  bishop = Piece.new('bishop', "\u2657", W)
  board[row_other_white, 2] = bishop

  bishop = Piece.new('bishop', "\u2657", W)
  board[row_other_white, 5] = bishop

  queen = Piece.new('queen', "\u2655", W)
  board[row_other_white, 3] = queen

  king = Piece.new('king', "\u2654", W)
  board[row_other_white, 4] = king

  for i in 0...8 do
    pawn = Pawn.new('pawn', "\u2659", W)
    board[row_pawn_white, i] = pawn
  end


  row_other_black = 0
  row_pawn_black = 1
  rook = Rook.new('rook', "\u265C", B)
  board[row_other_black, 0] = rook

  rook = Rook.new('rook', "\u265C", B)
  board[row_other_black, 7] = rook

  knight = Piece.new('knight', "\u265E", B)
  board[row_other_black, 1] = knight

  knight = Piece.new('knight', "\u265E", B)
  board[row_other_black, 6] = knight

  bishop = Piece.new('bishop', "\u265D", B)
  board[row_other_black, 2] = bishop

  bishop = Piece.new('bishop', "\u265D", B)
  board[row_other_black, 5] = bishop

  queen = Piece.new('queen', "\u265B", B)
  board[row_other_black, 3] = queen

  king = Piece.new('king', "\u265A", B)
  board[row_other_black, 4] = king

  for i in 0...8 do
    pawn = Pawn.new('pawn', "\u265F", B)
    board[row_pawn_black, i] = pawn
  end

end 
require_relative 'piece.rb'
require_relative 'constants.rb'
require_relative 'coord.rb'

def init(board)
  row_pawn_white = 6
  row_other_white = 7
  rook = Rook.new('rook', "\u2656", Player::W, Coord2D.new(row_other_white, 0))
  board[Coord2D.new(row_other_white, 0)] = rook

  rook = Rook.new('rook', "\u2656", Player::W, Coord2D.new(row_other_white, 7))
  board[Coord2D.new(row_other_white, 7)] = rook

  knight = Knight.new('knight', "\u2658", Player::W, Coord2D.new(row_other_white, 1))
  board[Coord2D.new(row_other_white, 1)] = knight

  knight = Knight.new('knight', "\u2658", Player::W, Coord2D.new(row_other_white, 6))
  board[Coord2D.new(row_other_white, 6)] = knight

  bishop = Bishop.new('bishop', "\u2657", Player::W, Coord2D.new(row_other_white, 2))
  board[Coord2D.new(row_other_white, 2)] = bishop

  bishop = Bishop.new('bishop', "\u2657", Player::W, Coord2D.new(row_other_white, 5))
  board[Coord2D.new(row_other_white, 5)] = bishop

  queen = Queen.new('queen', "\u2655", Player::W, Coord2D.new(row_other_white, 3))
  board[Coord2D.new(row_other_white, 3)] = queen

  king = WhiteKing.new('king', "\u2654", Player::W, Coord2D.new(row_other_white, 4))
  board[Coord2D.new(row_other_white, 4)] = king

  (0...8).each do |i|
    pawn = Pawn.new('pawn', "\u2659", Player::W, Coord2D.new(row_pawn_white, i))
    board[Coord2D.new(row_pawn_white, i)] = pawn
  end

  row_other_black = 0
  row_pawn_black = 1
  rook = Rook.new('rook', "\u265C", Player::B, Coord2D.new(row_other_black, 0))
  board[Coord2D.new(row_other_black, 0)] = rook

  rook = Rook.new('rook', "\u265C", Player::B, Coord2D.new(row_other_black, 7))
  board[Coord2D.new(row_other_black, 7)] = rook

  knight = Knight.new('knight', "\u265E", Player::B, Coord2D.new(row_other_black, 1))
  board[Coord2D.new(row_other_black, 1)] = knight

  knight = Knight.new('knight', "\u265E", Player::B, Coord2D.new(row_other_black, 6))
  board[Coord2D.new(row_other_black, 6)] = knight

  bishop = Bishop.new('bishop', "\u265D", Player::B, Coord2D.new(row_other_black, 2))
  board[Coord2D.new(row_other_black, 2)] = bishop

  bishop = Bishop.new('bishop', "\u265D", Player::B, Coord2D.new(row_other_black, 5))
  board[Coord2D.new(row_other_black, 5)] = bishop

  queen = Queen.new('queen', "\u265B", Player::B, Coord2D.new(row_other_black, 3))
  board[Coord2D.new(row_other_black, 3)] = queen

  king = BlackKing.new('king', "\u265A", Player::B, Coord2D.new(row_other_black, 4))
  board[Coord2D.new(row_other_black, 4)] = king

  (0...8).each do |i|
    pawn = Pawn.new('pawn', "\u265F", Player::B, Coord2D.new(row_pawn_black, i))
    board[Coord2D.new(row_pawn_black, i)] = pawn
  end
end

require './lib/game.rb'
require './lib/piece.rb'

describe King do
  it "goes one step in diagonals and rows and columns" do
    king = WhiteKing.new('king', "\u2654", Player::W)
    board = Arr2D.new(4)
    curr = Coord2D.new(1,1)
    board[curr.x, curr.y] = king
    res = king.possible_moves(board, curr)
    expect(res).to contain_exactly(Coord2D.new(0,0), Coord2D.new(1,0), Coord2D.new(2,0),
         Coord2D.new(1, 2), Coord2D.new(2, 2), Coord2D.new(2, 1),
        Coord2D.new(0, 2), Coord2D.new(0, 1), Coord2D.new(1, 3) ) 
  end
end
require './lib/rules.rb'
require './lib/game.rb'
require './lib/piece.rb'

describe Queen do
  it "goes in diagonals and rows and columns" do
    queen = Queen.new('queen', "\u2655", Player::W)
    board = Arr2D.new(4)
    curr = Coord2D.new(1,1)
    board[curr.x, curr.y] = queen
    res = queen.possible_moves(board, curr)
    expect(res).not_to include(Coord2D.new(0,3), Coord2D.new(3,0), Coord2D.new(2,3),
         Coord2D.new(3, 2))
  end
end
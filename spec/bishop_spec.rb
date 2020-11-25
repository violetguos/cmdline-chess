require './lib/rules.rb'
require './lib/game.rb'
require './lib/piece.rb'

describe Bishop do
  it "goes in diagonal until encountering another piece" do
    bishop = Bishop.new('bishop', "\u2657", Player::W)
    board = Arr2D.new(4)
    curr = Coord2D.new(1,1)
    board[curr.x, curr.y] = bishop
    res = bishop.possible_moves(board, curr)
    expect(res).to contain_exactly(Coord2D.new(0,0), Coord2D.new(2,2), Coord2D.new(3,3),
         Coord2D.new(0, 2), Coord2D.new(2, 0))
  end
end
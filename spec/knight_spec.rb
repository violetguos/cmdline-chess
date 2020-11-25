require './lib/rules.rb'
require './lib/game.rb'
require './lib/piece.rb'

describe Knight do
  it "can complete knight travail" do 
    knight = Knight.new('knight', "\u2658", Player::W)
    board = Arr2D.new(8)
    board[3, 3] = knight
    @directions = [Coord2D.new(2, 1), Coord2D.new(2, -1), Coord2D.new(-2, 1), Coord2D.new(-2, -1),
        Coord2D.new(1, 2), Coord2D.new(1, -2), Coord2D.new(-1, -2), Coord2D.new(-1, 2)
      ]
    res = knight.possible_moves(board, Coord2D.new(3 ,3))
    expect(res).to eql([Coord2D.new(5, 4), Coord2D.new(5, 2), Coord2D.new(1, 4), Coord2D.new(1, 2),
        Coord2D.new(4, 5), Coord2D.new(4, 1), Coord2D.new(2, 1), Coord2D.new(2, 5)])
  end
end
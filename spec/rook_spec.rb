require_relative '../lib/piece.rb'
require_relative '../lib/constants.rb'
require_relative '../lib/player.rb'
require_relative '../lib/coord.rb'


describe Rook do
    it "can move to the position right next to it" do
      rook = Rook.new('rook', "\u2656", Player::W)
      board = Arr2D.new(5)
      board[0, 0] = rook
      expect(board[1, 0]).to eql(nil)
      valid = rook.target_is_valid?(board, Coord2D.new(0, 0), Coord2D.new(1,0))
      expect(valid).to eql(true)    

    end
end
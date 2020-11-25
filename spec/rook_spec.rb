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

    it "can move to the edges" do
      rook = Rook.new('rook', "\u2656", Player::W)
      board = Arr2D.new(5)
      board[0, 0] = rook
      valid = rook.target_is_valid?(board, Coord2D.new(0, 0), Coord2D.new(4,0))
      expect(valid).to eql(true)    
    end

    it "cannot move to another row" do
      rook = Rook.new('rook', "\u2656", Player::W)
      board = Arr2D.new(5)
      board[0, 0] = rook
      valid = rook.target_is_valid?(board, Coord2D.new(0, 0), Coord2D.new(1,3))
      expect(valid).to eql(false)    
    end

    it "cannot jump over another piece" do
      rook = Rook.new('rook', "\u2656", Player::W)
      board = Arr2D.new(5)
      board[0, 0] = rook
      valid = rook.target_is_valid?(board, Coord2D.new(0, 0), Coord2D.new(1,3))
      expect(valid).to eql(false)    
    end

    it "cannot jump over another piece" do
      rook = Rook.new('rook', "\u2656", Player::W)
      rook_1 = Rook.new('rook', "\u2656", Player::W)
      pawn = Pawn.new('pawn', "\u2656", Player::B)
      board = Arr2D.new(5)
      board[0, 0] = rook
      board[0, 4] = pawn
      board[4, 0] = rook_1
      valid = rook.possible_moves(board, Coord2D.new(0, 0))
      expect(valid).not_to include(Coord2D.new(0,4), Coord2D.new(4,0))    
      expect(valid).to include(Coord2D.new(0,3), Coord2D.new(3,0))    

    end

end
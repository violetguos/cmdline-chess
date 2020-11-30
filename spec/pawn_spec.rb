require './lib/game.rb'
require './lib/piece.rb'

describe Pawn do
    it "verifies a pawn 1st move jump +1 for white player" do
      g = Game.new
      curr = Coord2D.new(6, 0)
      target = Coord2D.new(4, 0)
      pawn = g.board[curr.x, curr.y]
      expect(pawn.target_is_valid?(g.board, curr, target)).to eql(true)    
    end

    it "verifies a pawn 1st move no jump for white player" do
      g = Game.new
      curr = Coord2D.new(6, 0)
      target = Coord2D.new(5, 0)
      pawn = g.board[curr.x, curr.y]
      expect(pawn.target_is_valid?(g.board, curr, target)).to eql(true)    
    end

    it "verifies a pawn cannot jump our of bounds for white player" do
      g = Game.new
      curr = Coord2D.new(6, 0)
      target = Coord2D.new(3, 1)
      pawn = g.board[curr.x, curr.y]
      expect(pawn.target_is_valid?(g.board, curr, target)).to eql(false)    
    end

    it "verifies a pawn 1st move jump +1 for black player" do
      g = Game.new
      curr = Coord2D.new(1, 0)
      target = Coord2D.new(3, 0)
      pawn = g.board[curr.x, curr.y]
      expect(pawn.target_is_valid?(g.board, curr, target)).to eql(true)    
    end
  
    it "verifies a pawn 1st move no jump for black player" do
      g = Game.new
      curr = Coord2D.new(1, 0)
      target = Coord2D.new(2, 0)
      pawn = g.board[curr.x, curr.y]
      expect(pawn.target_is_valid?(g.board, curr, target)).to eql(true)    
    end
  
    it "verifies a pawn cannot jump our of bounds for black player" do
      g = Game.new
      curr = Coord2D.new(1, 0)
      target = Coord2D.new(4, 1)
      pawn = g.board[curr.x, curr.y]
      expect(pawn.target_is_valid?(g.board, curr, target)).to eql(false)    
    end

    it "verifies a pawn can jump when overtaking opponent" do
      board = Arr2D.new(4)
      pawn_w = Pawn.new('pawn', "\u2659", Player::W)
      pawn_b = Pawn.new('pawn', "\u265F", Player::B)
      curr = Coord2D.new(0, 0)
      target = Coord2D.new(1, 1)
      board[curr.x, curr.y] = pawn_w
      board[target.x, target.y] = pawn_b
      expect(pawn_w.target_is_valid?(board, curr, target)).to eql(true)
    end

    it "verifies a pawn cannot jump diagonally when it's not overtaking opponent" do
      board = Arr2D.new(4)
      pawn_w = Pawn.new('pawn', "\u2659", Player::W)
      pawn_w_2 = Pawn.new('pawn', "\u2659", Player::W)
      curr = Coord2D.new(0, 0)
      target = Coord2D.new(1, 1)
      board[curr.x, curr.y] = pawn_w
      board[target.x, target.y] = pawn_w_2
      expect(pawn_w.target_is_valid?(board, curr, target)).to eql(false)
    end
end
    
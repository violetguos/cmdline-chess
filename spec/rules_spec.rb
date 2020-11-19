require './lib/rules.rb'
require './lib/game.rb'


describe Rules do
    it "verifies a pawn 1st move jump +1 for white player" do
      g = Game.new
      curr = Coord2D.new(6, 0)
      target = Coord2D.new(4, 0)
      pawn = g.board[curr.x, curr.y]
      expect(Rules.pawn(pawn, curr, target)).to eql(true)    
    end

    it "verifies a pawn 1st move no jump for white player" do
        g = Game.new
        curr = Coord2D.new(6, 0)
        target = Coord2D.new(5, 0)
        pawn = g.board[curr.x, curr.y]
        expect(Rules.pawn(pawn, curr, target)).to eql(true)    
      end

    it "verifies a pawn cannot jump our of bounds for white player" do
        g = Game.new
        curr = Coord2D.new(6, 0)
        target = Coord2D.new(3, 1)
        pawn = g.board[curr.x, curr.y]
        expect(Rules.pawn(pawn, curr, target)).to eql(false)    
    end

    it "verifies a pawn 1st move jump +1 for black player" do
        g = Game.new
        curr = Coord2D.new(1, 0)
        target = Coord2D.new(3, 0)
        pawn = g.board[curr.x, curr.y]
        expect(Rules.pawn(pawn, curr, target)).to eql(true)    
      end
  
      it "verifies a pawn 1st move no jump for black player" do
          g = Game.new
          curr = Coord2D.new(1, 0)
          target = Coord2D.new(2, 0)
          pawn = g.board[curr.x, curr.y]
          expect(Rules.pawn(pawn, curr, target)).to eql(true)    
    end
  
      it "verifies a pawn cannot jump our of bounds for black player" do
          g = Game.new
          curr = Coord2D.new(1, 0)
          target = Coord2D.new(4, 1)
          pawn = g.board[curr.x, curr.y]
          expect(Rules.pawn(pawn, curr, target)).to eql(false)    
      end
  end
    
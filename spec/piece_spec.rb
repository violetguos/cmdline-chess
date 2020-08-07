require './lib/piece'

describe Piece do
    it "finds all possible destinations, ignore other pieces" do
        b = Board.new
        b.visual_legal_moves(b.white_pieces[:bishop][0])
        expect(b.white_pieces[:bishop][0].legal_moves).to eql([[1, 1], [2, 0], [1, 3], [2, 4], [3, 5], [4, 6], [5, 7]])
    end
  end
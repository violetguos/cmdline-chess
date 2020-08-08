require './lib/piece'

describe Piece do
    it "finds Bishop's possible destinations, ignore other pieces" do
        b = Board.new
        b.visual_legal_moves(b.white_pieces[:bishop][0])
        expect(b.white_pieces[:bishop][0].legal_moves).to eql([[1, 1], [2, 0], [1, 3], [2, 4], [3, 5], [4, 6], [5, 7]])
    end

    it "finds Pawn's 1st move" do
        b = Board.new
        b.visual_legal_moves(b.white_pieces[:pawn][0])
        expect(b.white_pieces[:pawn][0].legal_moves).to eql([[3, 0]])
    end

    it "finds Queen's possible destinations, ignore other pieces" do
        b = Board.new
        b.visual_legal_moves(b.white_pieces[:queen][0])
        p b.white_pieces[:queen][0].legal_moves
        expect(b.white_pieces[:queen][0].legal_moves.sort).to eql([
            [0,3], [0, 5], [0, 0], [0,1], [0,2], [0,6], [0,7],
            [1,3], [1,4], [1,5],
            [2,2], [2,4], [2,6],
            [3,1], [3,4], [3,7],
            [4,0], [4,4], [5,4], [6,4],[7,4]
        ].sort)
    end

end
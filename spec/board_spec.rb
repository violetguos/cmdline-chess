require 'yaml'
require './lib/board'

describe Piece do
  it "verifies each piece loads from Yaml" do
    test_hash = YAML.load(File.read("data/symbols.yaml"))
    test_hash.each do |key, value|
      piece = Piece.new(key.to_s, value[:legal_moves], value[:unicode])
      expect(piece.name).to eql(key.to_s)
    end
  end
end

describe Board do
  it "moves a piece to new location, deletes old" do
    b = Board.new
    b.move(b.pieces[:queen], [3, 2])
    expect(b.board_config[0][4]).to eql(nil)
  end
end


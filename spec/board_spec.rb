require 'yaml'
require './lib/board'
describe Piece do
  it "verifies each piece loads from Yaml" do
    test_hash = YAML.load(File.read("data/symbols.yaml"))
    test_hash.each do |key, value|
      piece = Piece.new(key.to_s, value[0][:legal_moves])
      expect(piece.name).to eql(key.to_s)
      expect(piece.legal_moves).to eql("TODO")
    end

  end
end

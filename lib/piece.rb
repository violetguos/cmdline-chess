require 'YAML'
require 'pry'

class Piece
  attr_accessor :name, :legal_moves , :unicode
  def initialize(name, legal_moves, unicode)
    @name = name
    #@legal_moves = legal_moves
    @unicode = unicode
  end
  
  def check_move(destination)
    # TODO
    true
  end
  
end # class

module White
  def self.pieces()
    white_pieces = {}
    test_hash = YAML.load(File.read("data/symbols.yaml"))
    test_hash.each do |key, value|
      piece = Piece.new(key.to_s, value[:legal_moves], value[:unicode])
        white_pieces[key] = piece
    end
    return white_pieces
  end
end


#p h
#TODO: how to add multiple pawns

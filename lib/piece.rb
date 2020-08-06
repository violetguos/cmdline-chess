require 'YAML'
require 'pry'

class Piece
  attr_accessor :name, :legal_moves , :unicode
  def initialize(name, legal_moves, unicode, total)
    @name = name
    #@legal_moves = legal_moves
    @unicode = unicode
    @total = total
  end
  
  def check_move(destination)
    # TODO
    true
  end
  
end # class

module White
  def self.pieces()
    white_pieces = {}
    data_hash = YAML.load(File.read("data/symbols.yaml"))
    data_hash.each do |key, value|
      white_pieces[key] = []
      for i in 0...value[:total]
        piece = Piece.new(key.to_s, value[:legal_moves], value[:unicode], value[:total])
        white_pieces[key].push(piece)
      end
    end
    return white_pieces
  end
end

module Black
  def self.pieces()
    pieces = {}
    data_hash = YAML.load(File.read("data/symbols.yaml"))
    data_hash.each do |key, value|
      pieces[key] = []
      for i in 0...value[:total]
        piece = Piece.new(key.to_s, value[:legal_moves], value[:unicode], value[:total])
        pieces[key].push(piece)
      end
    end
    return pieces
  end
end


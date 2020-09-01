class Piece
  attr_accessor :name, :legal_moves , :unicode, :player, :default_moves
  def initialize(name, unicode, total, player)
    @name = name
    @unicode = unicode
    @player = player
    @legal_moves = []
  end

end
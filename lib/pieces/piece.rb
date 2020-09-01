class Piece
  attr_reader :name, :legal_moves , :unicode, :player, :default_moves
  def initialize(name, unicode, player)
    @name = name
    @unicode = unicode
    @player = player
    @legal_moves = []
  end

end
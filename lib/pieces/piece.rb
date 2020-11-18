class Piece
  attr_reader :name, :legal_moves, :unicode, :player, :moved
  def initialize(name, unicode, player)
    @name = name
    @unicode = unicode
    @player = player
    @moved = false
  end
end

class Piece
  attr_accessor :name, :legal_moves , :unicode, :player, :default_moves
  def initialize(name, default_moves, unicode, total, player)
    @name = name
    @legal_moves = nil 
    @unicode = unicode
    @total = total
    @player = player
    @default_moves = default_moves
  end



end
class Piece
  attr_accessor :name, :legal_moves
  def initialize(name, legal_moves)
    @name = name
    @legal_moves = legal_moves
  end
end # class


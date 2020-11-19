require_relative 'constants'
class Piece
  attr_reader :name, :unicode, :player, :forward
  attr_accessor :moved
  def initialize(name, unicode, player, moved=false)
    @name = name
    @unicode = unicode
    @player = player
    @moved = moved
    @forward = player == W ? -1 : 1
  end
end

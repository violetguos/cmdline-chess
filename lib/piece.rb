require_relative 'coord.rb'
require 'set'
module Player
  B = 'Black'.freeze
  W = 'White'.freeze
end

class Piece
  attr_reader :name, :unicode, :player, :forward
  attr_accessor :moved
  def initialize(name, unicode, player, moved=false)
    @name = name
    @unicode = unicode
    @player = player
    @moved = moved
  end
 
end

class Rook < Piece
  def initialize(name, unicode, player, moved=false)
    super
    @directions =  [
      Coord2D.new(1, 0), Coord2D.new(-1, 0),
      Coord2D.new(0, -1),  Coord2D.new(0, 1)
    ]
  end

  def target_is_valid?(board, curr, target)
    valid = false
    valid_moves = no_jump(board, curr)
    valid_moves.each do |move|
      valid = true if move == target
    end  
    valid
  end

  def no_jump(board, curr)
    legit_moves = []
    occupied = false
    @directions.each do |direction|
      occupied = false
      new_coord = curr + direction
      
      while new_coord.x.between?(0, board.dim-1) && new_coord.y.between?(0, board.dim-1) && !occupied
        if board[new_coord.x, new_coord.y] == nil
          legit_moves << new_coord
        else 
          occupied = true
        end
        new_coord = new_coord + direction
      end
    end
    res = legit_moves.uniq { |f| [ f.x, f.y ] }
    res
  end

end

class Pawn < Piece
  def initialize(name, unicode, player, moved=false)
    super
    @forward = @player == Player::W ? -1 : 1
    
  end

  def target_is_valid?(board, curr, target)
    if !@moved && target.x - curr.x == @forward * 2 && curr.y == target.y
      return true
    elsif !@moved && target.x - curr.x == @forward * 1 && curr.y == target.y
      return true
    elsif !@moved && target.x - curr.x == @forward * 1 && curr.y == target.y
      return true
    end
    false
  end

end 
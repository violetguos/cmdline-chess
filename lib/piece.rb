require_relative 'coord.rb'
require 'set'
module Player
  B = 'Black'.freeze
  W = 'White'.freeze
end

class Piece
  attr_reader :name, :unicode, :player, :forward
  attr_accessor :moved, :position
  def initialize(name, unicode, player, position, moved = false)
    @name = name
    @unicode = unicode
    @player = player
    @moved = moved
    @position = position
  end

  def destroy
    puts "Piece #{@name} of #{@player} destoryed"
  end

  def is_colour?(colour)
    @player == colour ? true : false
  end

  def target_is_valid?(board, curr, target)
    valid = false
    valid_moves = possible_moves(board, curr)
    valid_moves.each do |move|
      valid = true if move == target
    end
    valid
  end 
end

class Rook < Piece
  def initialize(name, unicode, player, moved = false)
    super
    @directions = [
      Coord2D.new(1, 0), Coord2D.new(-1, 0),
      Coord2D.new(0, -1),  Coord2D.new(0, 1)
    ]
  end

  def target_is_valid?(board, curr, target)
    super

  end

  def possible_moves(board, curr)
    legit_moves = []
    @directions.each do |direction|
      blocked = false
      new_coord = curr + direction

      while new_coord.x.between?(0, board.dim - 1) && new_coord.y.between?(0, board.dim - 1) && !blocked
        if board[new_coord.x, new_coord.y].nil?
          legit_moves << new_coord
        else
          blocked = true
        end
        new_coord += direction
      end
    end
    res = legit_moves.uniq { |f| [f.x, f.y] }
    res
  end
end

class Pawn < Piece
  def initialize(name, unicode, player, moved = false)
    super
    @forward = @player == Player::W ? -1 : 1
  end

  def target_is_valid?(_board, curr, target)
    if !@moved && target.x - curr.x == @forward * 2 && curr.y == target.y
      return true
    elsif target.x - curr.x == @forward * 1 && curr.y == target.y
      return true
    elsif target.x - curr.x == @forward * 1 && curr.y == target.y
      return true
    end
    # taking a piece, walk diagonally
    if _board[target.x, target.y] != nil && !_board[target.x, target.y].is_colour?(@player)
      if target.x - curr.x == @forward * 1 && target.y - curr.y == @forward * 1 
        return true
      else target.x - curr.x == @forward * -1 && target.y - curr.y == @forward * 1 
        return true
      end
    end 

    false
  end

  def possible_moves(board, curr)
    legit_moves = []

    if !moved
      pos = Coord2D.new(@forward * 2 + curr.x, curr.y)
      if board[pos.x, pos.y] == nil
        legit_moves.push(pos)
      end
    end
    pos = Coord2D.new(@forward * 1 + curr.x, curr.y)
    if board[pos.x, pos.y] == nil
        legit_moves.push(pos)
    end
    legit_moves
  end
end

class Knight < Piece
  def initialize(name, unicode, player, moved = false)
    super
    @directions = [Coord2D.new(2, 1), Coord2D.new(2, -1), Coord2D.new(-2, 1), Coord2D.new(-2, -1),
                   Coord2D.new(1, 2), Coord2D.new(1, -2), Coord2D.new(-1, -2), Coord2D.new(-1, 2)]
  end

  def target_is_valid?(board, curr, target)
    legit = false
    all_moves = possible_moves(board, curr)
    all_moves.each do |m|
      legit = true if m == target
    end
    legit
  end

  def possible_moves(board, curr)
    legit_moves = []
    @directions.each do |direction|
      new_coord = curr + direction
      if new_coord.x.between?(0, board.dim - 1) && new_coord.y.between?(0, board.dim - 1)
        legit_moves << new_coord if board[new_coord.x, new_coord.y].nil?
      end
    end
    res = legit_moves.uniq { |f| [f.x, f.y] }
    res
  end
end

class Bishop < Piece
  def initialize(name, unicode, player, moved = false)
    super
    @directions = [Coord2D.new(1, 1), Coord2D.new(1, -1), Coord2D.new(-1, 1),
                   Coord2D.new(-1, -1)]
  end

  def possible_moves(board, curr)
    legit_moves = []
    @directions.each do |direction|
      blocked = false
      new_coord = curr + direction
      while new_coord.x.between?(0, board.dim - 1) && new_coord.y.between?(0, board.dim - 1) && !blocked
        if board[new_coord.x, new_coord.y].nil?
          legit_moves << new_coord
        else
          blocked = true
        end
        new_coord += direction
      end
    end
    res = legit_moves.uniq { |f| [f.x, f.y] }
    res
  end
end

class Queen < Piece
  def initialize(name, unicode, player, moved = false)
    super
    @directions = [Coord2D.new(1, 1), Coord2D.new(1, -1), Coord2D.new(-1, 1),
                   Coord2D.new(-1, -1), Coord2D.new(1, 0), Coord2D.new(-1, 0),
                   Coord2D.new(0, -1),  Coord2D.new(0, 1)]
  end

  def possible_moves(board, curr)
    legit_moves = []
    @directions.each do |direction|
      blocked = false
      new_coord = curr + direction
      while new_coord.x.between?(0, board.dim - 1) && new_coord.y.between?(0, board.dim - 1) && !blocked
        if board[new_coord.x, new_coord.y].nil?
          legit_moves << new_coord
        else
          blocked = true
        end
        new_coord += direction
      end
    end
    res = legit_moves.uniq { |f| [f.x, f.y] }
    res
  end
end

class King < Piece
  def initialize(name, unicode, player, moved = false)
    super
    @directions = [Coord2D.new(1, 1), Coord2D.new(1, -1), Coord2D.new(-1, 1),
                   Coord2D.new(-1, -1), Coord2D.new(1, 0), Coord2D.new(-1, 0),
                   Coord2D.new(0, -1),  Coord2D.new(0, 1)]
  end

  def possible_moves(board, curr)
    legit_moves = []
    @directions.each do |direction|
      new_coord = curr + direction
      if new_coord.x.between?(0, board.dim - 1) && new_coord.y.between?(0, board.dim - 1)
        legit_moves << new_coord if board[new_coord.x, new_coord.y].nil?
      end
    end
    res = legit_moves.uniq { |f| [f.x, f.y] }
    res
  end 
end

class WhiteKing < King
  def initialize(name, unicode, player, moved = false)
    super
    @castle_o_o = Coord2D.new(0, 2)
  end 

  def possible_moves(board, curr)
    @directions << @castle_o_o unless moved 
    res = super  
  end

end

class BlackKing < King
  def initialize(name, unicode, player, moved = false)
    super
    @castle_o_o = Coord2D.new(0, -2)
  end 

  def possible_moves(board, curr)
    @directions << @castle_o_o unless moved 
    res = super  
  end
end
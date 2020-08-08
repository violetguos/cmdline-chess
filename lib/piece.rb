require 'YAML'
require 'pry'
require_relative 'constants'

class Piece
  attr_accessor :name, :legal_moves , :unicode, :player, :default_moves
  def initialize(name, default_moves, unicode, total, player)
    @name = name
    @legal_moves = nil 
    @unicode = unicode
    @total = total
    @player = player
    @dim = 8
    @default_moves = default_moves
  end

  def go_diag(curr)
    moves = []
    x = curr[0]
    y = curr[1]
    while x >= 0 && y >= 0
      if x!= curr[0] && y!=curr[1]
        moves.push([x, y])
      end
      x -= 1
      y -= 1
    end

    x = curr[0]
    y = curr[1]
    while x < @dim && y >= 0
      if x!= curr[0] && y!=curr[1]
        moves.push([x, y])
      end
      x += 1
      y -= 1
    end

    x = curr[0]
    y = curr[1]
    while x >= 0 && y < @dim
      if x!= curr[0] && y!=curr[1]
        moves.push([x, y])
      end
      x -= 1
      y += 1
    end

    x = curr[0]
    y = curr[1]
    while x < @dim && y < @dim
      if x!= curr[0] && y!=curr[1]
        moves.push([x, y])
      end
      x += 1
      y += 1
    end
    return moves

  end

  def go_row(curr, moves)
    for i in 0...@dim
      moves.push([curr[0], i]) if i!=curr[1]
    end
  end

  def go_col(curr, moves)
    for i in 0...@dim
      moves.push([i, curr[1]]) if i!=curr[0]
    end 
  end

  def go_pawn(curr, moves)
    # beginnging vs in session, not tested with taking yet
    if curr[0] == 1 && @player == "W"
      moves.push([2+curr[0], curr[1]])
    elsif curr[0]== 6 && @player == "B"
      moves.push([-2+curr[0], curr[1]])
    elsif @player == "W"
      moves.push([1+curr[0], curr[1]])
    elsif @player == "B"
      moves.push([-1+curr[0], curr[1]])
    end
  end

  def go(curr, moves)
    @default_moves.each do |m|
      moves.push([m[0] + curr[0], m[1]+curr[1]])
    end 
  end

  def check_boundary
    checked_moves = []
    @legal_moves.each do |m|
      if !(m[0] < 0 || m[0] >= @dim || m[1]<0 || m[1] >= @dim)
        checked_moves.push(m)
      end
    end
    @legal_moves = checked_moves
  end

  def all_possible_moves(curr)
      # no boundary checking or taking or obstacle detection yet
      moves = []
      case @name
      when ROOK
        go_col(curr, moves)
        go_row(curr, moves)
        @legal_moves = moves 
      
      when BISHOP
        go_diag(curr).each {|a| moves.push(a)}
        @legal_moves = moves

      when QUEEN
        go_diag(curr).each {|a| moves.push(a)}
        go_col(curr, moves)
        go_row(curr, moves)
        go(curr, moves)
        @legal_moves = moves

      when PAWN 
       go_pawn(curr, moves)
       @legal_moves = moves
      else 
        go(curr, moves)
      
      end
    check_boundary
    @legal_moves = @legal_moves.uniq
    @legal_moves
  end

  def check_move(curr, destination)
    @legal_moves = all_possible_moves(curr)
    p @name, @legal_moves

    @legal_moves.each do |m|
      if m[0] == destination[0] && m[1] == destination[1]
        return true
      end
    end
    false
  end
  
end # class

module White
  def self.pieces()
    white_pieces = {}
    data_hash = YAML.load(File.read("data/symbols.yaml"))
    data_hash.each do |key, value|
      white_pieces[key] = []
      for i in 0...value[:total]
        piece = Piece.new(key.to_s, value[:default_moves], value[:unicode], value[:total], "W")
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
        piece = Piece.new(key.to_s, value[:default_moves], value[:unicode], value[:total], "B")
        pieces[key].push(piece)
      end
    end
    return pieces
  end
end


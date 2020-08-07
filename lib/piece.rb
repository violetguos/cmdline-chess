require 'YAML'
require 'pry'
require_relative 'constants'

class Piece
  attr_accessor :name, :legal_moves , :unicode, :player
  def initialize(name, legal_moves, unicode, total, player)
    @name = name
    @legal_moves = legal_moves 
    @unicode = unicode
    @total = total
    @player = player
    @dim = 8
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
  
  def all_possible_moves(curr)
    p @legal_moves.any? String
    if @legal_moves.any? String
      moves = []
      @legal_moves.each  do |m|
        case m
        when ROW
          for i in 0...8
            moves.push([curr[0], i]) if i!=curr[1]
          end
        
        when COL
          for i in 0...8
            moves.push([i, curr[1]]) if i!=curr[0]
          end

        when DIAGS
          go_diag(curr).each {|a| moves.push(a)}

        when "PAWN"
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
      end
      @legal_moves = moves
    end
    @legal_moves
  end

  def check_move(curr, destination)
    all_possible_moves(curr)
    p @legal_moves
    @legal_moves.each do |m|
      if m[0] + curr[0] == destination[0] && m[1] + curr[1] == destination[1]
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
        piece = Piece.new(key.to_s, value[:legal_moves], value[:unicode], value[:total], "W")
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
        piece = Piece.new(key.to_s, value[:legal_moves], value[:unicode], value[:total], "B")
        pieces[key].push(piece)
      end
    end
    return pieces
  end
end


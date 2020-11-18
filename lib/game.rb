require_relative 'coord'
require_relative 'pieces/pawn.rb'
require_relative 'pieces/rook.rb'
require_relative 'pieces/piece.rb'
require_relative 'constants'

class Game
  attr_accessor :board
  def initialize
    @board = Arr2D.new(8)

    rook = Rook.new('rook', "\u2656", W)
    @board[0, 0] = rook

    rook = Rook.new('rook', "\u2656", W)
    @board[0, 7] = rook

    knight = Piece.new('knight', "\u2658", W)
    @board[0, 1] = knight

    knight = Piece.new('knight', "\u2658", W)
    @board[0, 6] = knight

    bishop = Piece.new('bishop', "\u2657", W)
    @board[0, 2] = bishop

    bishop = Piece.new('bishop', "\u2657", W)
    @board[0, 5] = bishop

    queen = Piece.new('queen', "\u2655", W)
    @board[0, 3] = queen

    king = Piece.new('king', "\u2654", W)
    @board[0, 4] = king

    for i in 0...8 do
      pawn = Pawn.new('pawn', "\u2659", W)
      @board[1, i] = pawn
    end

    @board.p
  end

  def prompt
    @board.p
    puts 'Enter current col: '
    # converts board notation to array position
    col_curr = gets.strip.to_i - 1

    puts 'Enter current row: '
    row_curr = gets.strip.ord - 'a'.ord
    curr = Coord2D.new(row_curr, col_curr)

    puts 'Enter target column: '
    col = gets.strip.to_i - 1
    puts 'Enter target row: '
    row = gets.strip.ord - 'a'.ord
    target = Coord2D.new(row, col)
    move(curr, target)
  end

  def move(curr, target)
    # process the positions
    curr_piece = @board[curr.x, curr.y]
    @board[target.x, target.y] = curr_piece
    @board[curr.x, curr.y] = nil
  end

  def save
    puts 'Would you like to save game? [y/n]'
    ans = gets.chomp
    if ans.downcase == 'y'
      File.open('game', 'w+') do |f|
        f.write(Marshal.dump(self))
      end
    end
    true
  end

  def self.load
    Marshal.load(File.binread('game'))
  end

  def turns
    i = 0
    while i < 3
      prompt
      @board.p
      i += 1
    end
  end
end

g = Game.new
g.turns

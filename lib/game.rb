require_relative 'board'
require_relative 'coord'

class Game
  attr_accessor :board
  def initialize
    @board = Arr2D.new(8)
    pawn = Pawn.new('pawn', "\u2659", W)
    @board[1, 0] = pawn
    rook = Rook.new('rook', "\u2659", W)
    @board[0, 0] = rook
    @board.p

  end

  def prompt
    @board.p
    puts "Enter current col: "
    # converts board notation to array position
    col_curr = gets.strip.to_i - 1
    
    puts "Enter current row: "
    row_curr = gets.strip.ord - "a".ord
    curr = Coord2D.new(row_curr, col_curr)

    puts "Enter target column: "
    col = gets.strip.to_i - 1
    puts "Enter target row: "
    row = gets.strip.ord - "a".ord
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
    puts "Would you like to save game? [y/n]"
    ans = gets.chomp
    if ans.downcase == "y"
        File.open('game', 'w+') do |f|  
            f.write(Marshal.dump(self))
        end  
    end
    return true 
  end

  def self.load
    Marshal.load(File.binread("game"))
  end

  def turns
    i = 0
    while i < 3 
      prompt
      @board.p
      i+=1
    end
  end
end

g = Game.new
g.turns
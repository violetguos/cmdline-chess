require_relative 'board'


class Game
  attr_accessor :board
  def initialize
    @board = Board.new

  end

  def prompt
    @board.print_b
    puts "Enter piece: "
    piece = gets.strip.chars
    puts "Enter target column: "
    col = gets.strip.to_i
    puts "Enter target column: "
    row = gets.strip.to_i
    @board.move(@board.white_pieces[:pawn][0],[row, col])
    @board.print_b

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

end

g = Game.new
g.prompt
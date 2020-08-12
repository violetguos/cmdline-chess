require_relative 'board'


class Game
  attr_accessor :board
  def initialize
    @board = Board.new

  end

  def prompt
    @board.print_b
    puts "Enter piece: "
    piece = gets.chomp
    puts "Enter target column: "
    col = gets.strip.to_i
    puts "Enter target row: "
    row = gets.strip.to_i
    puts "Overtake [y/n]: "
    overtake = gets.chomp == "y"? true : false
    if overtake
      @board.overtake(row, col)
    end 
    
    @board.move(@board.white_pieces[piece.to_sym][0],[row, col])
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

  def turns
    #prompt
    @board.random_move
    @board.print_b
  end
end

g = Game.new
g.turns
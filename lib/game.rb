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
    puts "Enter current col: "
    col_curr = gets.strip.to_i
    
    puts "Enter current row: "
    row_curr = gets.strip.to_i

    puts "Enter target column: "
    col = gets.strip.to_i
    puts "Enter target row: "
    row = gets.strip.to_i
    puts "Overtake [y/n]: "
    overtake = gets.chomp == "y"? true : false
    if overtake
      @board.overtake(row, col)
    end 
    
    @board.move(@board.board_config[row_curr][col_curr],[row, col])
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
    i = 0
    while i < 3 
      prompt
      @board.random_move
      @board.print_b
      i+=1
    end
  end
end

g = Game.new
g.turns
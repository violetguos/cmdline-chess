require_relative 'coord.rb'
require_relative 'constants.rb'
require_relative 'rules'

class Game
  attr_accessor :board
  def initialize
    @board = Arr2D.new(8)
    require_relative 'init_board'
    init(@board)

  end

  def prompt(player)
    @board.p
    puts "Current player #{player}"
    puts 'Enter current colmnn: '
    # converts board notation to array position
    col_curr = gets.strip.ord - 'a'.ord 

    puts 'Enter current row: '
    row_curr = 8 - gets.strip.to_i 
    curr = Coord2D.new(row_curr, col_curr)

    puts 'Enter target column: '
    col = gets.strip.ord - 'a'.ord
    puts 'Enter target row: '
    row = 8 - gets.strip.to_i 
    target = Coord2D.new(row, col)
    curr_piece = @board[curr.x, curr.y]
    if Rules.knight(curr_piece, curr, target)
      move(curr, target)
    else 
      raise 'you broke rules'
    end
  end

  def move(curr, target)
    # process the positions
    curr_piece = @board[curr.x, curr.y]
    @board[target.x, target.y] = curr_piece
    @board[curr.x, curr.y] = nil
    curr_piece.moved = true
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
      i%2==0 ? player = W : player = B
      prompt(player)
      i += 1
    end
  end
end


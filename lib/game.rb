require_relative 'coord.rb'
require_relative 'constants.rb'
require_relative 'player.rb'
require_relative 'pgn_parser.rb'


class Game
  attr_accessor :board
  def initialize
    @board = Arr2D.new(8)
    require_relative 'init_board'
    init(@board)
  end

  def prompt(player)
    loop do
      @board.p
      curr = get_current_piece(player)
      target = get_destination

      curr_piece = @board[curr.x, curr.y]
      if curr_piece.target_is_valid?(@board, curr, target)
        move(curr, target)
        break
      else
        puts 'reenter the target'
      end
    end

  end

  def auto_prompt(player)
    
    hash = load_openings
    arr = hash[0]
    print arr

      arr.each_slice(2) do |move_1, move_2|
        str_1 = regex_coord(move_1)
        str_2 = regex_coord(move_2)
        puts str_1
        puts str_2
        @board.p
        curr = Coord2D.new(8-str_1[1].to_i, str_1[0].strip.ord - 'a'.ord)
        target = Coord2D.new(8-str_2[1].to_i, str_2[0].strip.ord-'a'.ord)
        move(curr, target)
      end
    
  end

  def get_current_piece(player)
    curr = nil
    loop do
      puts "Current player #{player}"
      puts 'Enter current colmnn: '
      # converts board notation to array position
      col_curr = gets.strip.ord - 'a'.ord

      puts 'Enter current row: '
      row_curr = 8 - gets.strip.to_i
      curr = Coord2D.new(row_curr, col_curr)
      break if piece_valid?(curr, player)
    end
    curr
  end

  def piece_valid?(curr, player)
    # && @board[curr.x, curr.y].player == player
    begin
      piece = @board[curr.x, curr.y]
      unless piece.is_colour?(player)
        puts "This is not your piece. Please try again."
      end
    rescue => exception
      puts "#{exception}. Please try again"
      return false
    end
    true
  end

  def get_destination
    target = nil
    loop do 
      puts 'Enter target column: '
      col = gets.strip.ord - 'a'.ord
      puts 'Enter target row: '
      row = 8 - gets.strip.to_i
      target = Coord2D.new(row, col)
      break if destination_valid?(target)
    end
    target
  end

  def destination_valid?(dest)
    begin
      val = @board[dest.x, dest.y]
    rescue => exception
      puts "#{exception}. Please try again"
      return false
    end
    true

  end

  def move(curr, target)
    # process the positions
    puts curr
    puts target
    curr_piece = @board[curr.x, curr.y]
    puts curr_piece
    target_piece = @board[target.x, target.y]
    puts target_piece
    if target_piece != nil
      target_piece.destroy
      target_piece = nil
    end
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
    while i < 40
      player = i.even? ? Player::W : Player::B
      auto_prompt(player)
      i += 1
    end
  end
end

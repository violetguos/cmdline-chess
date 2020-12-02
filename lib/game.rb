require_relative 'coord.rb'
require_relative 'constants.rb'
require_relative 'player.rb'
require_relative 'game_parser.rb'
require_relative 'load.rb'
require 'yaml'

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

  def auto_prompt(file)
    
    moves = load_game(file)
    moves.each_with_index do |coord, i|
      player = i.even? ? Player::W : Player::B
      @board.p
      puts coord
      # move is a string combo of the PGN notation
      curr   = Coord2D.new(8-coord[0][1].to_i, coord[0][0].strip.ord - 'a'.ord)
      target = Coord2D.new(8-coord[1][1].to_i, coord[1][0].strip.ord-'a'.ord)
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
    if king_castle?(curr_piece, curr, target)
      # move the rook
      castle_move_rook(Coord2D.new(curr.x, 7), Coord2D.new(curr.x, 5))
    end
    puts target_piece
    if target_piece != nil
      target_piece.destroy
      target_piece = nil
    end
    @board[target.x, target.y] = curr_piece
    @board[curr.x, curr.y] = nil
    curr_piece.moved = true
  end

  def king_castle?(curr_piece, curr, target)
    if curr_piece.name == KING && !curr_piece.moved 
      if target - curr == Coord2D.new(0, 2)
        return true
      end 
    end 
    false 
  end

  def castle_move_rook(curr, target)
    rook = @board[curr.x, curr.y]
    @board[target.x, target.y] = rook 
    rook.moved = true
    @board[curr.x, curr.y] = nil
  end

  def save
    puts 'Would you like to save game? [y/n]'
    ans = gets.chomp
    if ans.downcase == 'y'
      File.open("data/game.yml", "w") { |file| file.write(@board.to_yaml) }

    end
    true
  end

  def load
    filename = "data/game.yml"
    saved = File.open(File.join(Dir.pwd, filename), 'r')
    @board = YAML.load(saved)
    
  end

  def turns
    i = 0
    while i < 40
      player = i.even? ? Player::W : Player::B
      save
      prompt(player)
      i += 1
    end
  end
end

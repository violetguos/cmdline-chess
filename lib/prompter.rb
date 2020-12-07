module Prompter
  def start
    puts "Welcome! Please indicate
    1) Human vs human
    2) Load a game from DB
    3) Continue your last game
    4) Human vs Computer"

    user_choice = gets.strip.to_i
    until [1, 2, 3, 4].include?(user_choice)
      puts "Invalid option, try again"
      user_choice = gets.strip.to_i

    end
    return user_choice
  end

  def read_game_db
    puts "Indicate which game you like to watch"

    games = Dir.children("data/game_db").map.with_index do |game, i| 
      puts "#{i}. #{game}" if ['.game'].include? File.extname(game)
      game
    end
    user_choice = gets.strip.to_i
    until [1, 2].include?(user_choice)
      puts "Invalid option, try again"
      user_choice = gets.strip.to_i

    end
    return games[user_choice]

  end
end
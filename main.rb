require_relative 'lib/game.rb'
require_relative 'lib/prompter.rb'

include Prompter
g = Game.new
user_choice = Prompter.start

case user_choice
when 1
  g.turns
when 2
  game_file = Prompter.read_game_db
  g.auto_prompt(game_file)
end

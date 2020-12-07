require_relative 'lib/game.rb'
require_relative 'lib/prompter.rb'

include Prompter
user_choice = Prompter.start

case user_choice
when 1
  g = Game.new
  g.turns(1)
when 2
  g = Game.new
  game_file = Prompter.read_game_db
  g.auto_prompt(game_file)
when 3
  g = Game.new 
  g.load
  g.turns
when 4
  g = Game.new
  g.turns(4)
end

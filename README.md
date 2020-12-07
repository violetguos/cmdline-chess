# cmdline-chess

A basic chess game on command line.

1. Run `bundle install `
2. Run `ruby main.rb`

## For Developers

### Board coordinate system

I designed a 2D coordinate to facilitate accessing the 2D chess board. I overloaded operators so that we can calculate distances between two squares.

### 2D array for board

The board's access `[]` method is also overloaded. The `[]`(gettor) and `[]=`(settor) both check if the coordinate is within the limit of a chess board. I designed a hard `raise` error if it's out of boundry, but the methods in the game would use `rescue`. The user tries again instead of terminating the program.

## Lessons learned

- Testing ruby code
- use rubocup
- structuring larger projects
- persistence (i basically deleted the whole project and restarted)
- don't overengineer things, define your MVP first

## What I like in this project

- the coordinate and board system

## What I'd done differently

- find a way to use Ruby's namespace systems more elegantly
  - Break up `lib/game.rb`
  - Break up `lib/piece.rb`
  - `lib/piece.rb` is kept as a large file because of circular import problems
  - `game.rb` is a long file because all the functions need the `@board` parameter

## Load a game from Apple's chess console

1. Click save

2. Choose game format 'Chess Game' (`.game`)

3. Move this `.game` to this project's `data/game_db`

4. When prompted, choose " 2) Load a game from DB"

### Why I don't support `.pgn`

For the life of me, I can't figure out how to load [this](https://en.wikipedia.org/wiki/Portable_Game_Notation) into my board.

PGN only records the destination of a piece for each player. A human player can easily tell which piece moved there because you can quickly sift through the rules and constraints. My parser isn't that smart, unfortunately.

Apple's .game file is an XML, which I parse with a ruby library. The XML file records the coordinates of the piece, and the coordinates of its destination. It's also the approach I take in prompting users & saving my game. You need to run install `Gemfile`.

## Workflow of a human vs human game

- white goes first
- each player inputs column, row _separately_ using the [standrad algebraic notation](<https://en.wikipedia.org/wiki/Algebraic_notation_(chess)>)
- the player must input a valid piece and a valid destination. if not, the prompt repeats

## Moves supported

- all basic movements (en passant not supported)
- king castle (without explicit commands), just input the coordinates
- simple AI player (choose available pieces and random moves)

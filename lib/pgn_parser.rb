def load_openings
  file = File.open(File.join(Dir.pwd, '/data/game.pgn'), &:read)
  games = file.split('[Event "')
  games.shift # get rid of empty value at beginning
                                # (.+Result\s["\w\.\]]+)?

  regexp = /
    Date\s"                    # comes before date
    (?<date>[\d\.\?]+).+       # date
    White\s"                   # comes before first player
    (?<white>[^,"]+).+         # first player
    Black\s"                   # comes before second player
    (?<black>[^,"]+)           # second player
    (.+EventDate\s["\w\.\]]+)? # game info ends with either this line...
    (.+ECO\s["\w\]]+)?         # or this line
    ([\r\n]+)?                 # different files have different combinations of line break chars
    (?<moves>.+)               # moves
  /mx
  games.each_with_object([]) do |game, array|
    data = game.match(regexp)
    array << data[:moves].gsub(/\r\n/, ' ').gsub(/\d+\./, '').split
  end
end

def regex_coord(move)
  if move.chars.last(1) == '+'
    str = move[-3..-2] || move
    
  else
    str = move[-2..-1] ||  move
  end
  return str
end

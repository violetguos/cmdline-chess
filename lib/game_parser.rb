require 'nokogiri'

def load_game(file)
  doc = File.open(File.join("data/game_db", file)) { |f| Nokogiri::XML(f) }
  moves = doc.search('key:contains("Moves")').map{ |node|
    node.next_element.text
    
  }

  res = moves.reject { |c| c.empty? }[0].split("\n").map{ |move|
    # split each move with \n
    move.scan(/.{2}/) # split into 2d Coordinates
  }
end

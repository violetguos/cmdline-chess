require 'yaml'
require './lib/board'

describe Board do
  it "moves a piece to new location, deletes old" do
    b = Board.new
    b.move(b.white_pieces[:queen][0], [0, 3])
    expect(b.board_config[0][4]).to eql(nil)    
  end
end

require './lib/ship'
require './lib/cell'
require './lib/board'

RSpec.describe Board do
  before(:each) do
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)

  end


  describe '#initialize' do
    it 'exists' do
        expect(@board).to be_instance_of(Board)
    end
  end

  it "has board cells" do
    expect(@board.cells).to be_instance_of(Hash)
  end
  it "cell coordinate is correct" do
    expect(@board.cells["B4"].coordinate).to eq("B4")
  end

  it "is a valid coordinate" do
    expect(@board.valid_coordinate?("A1")).to eq(true)
    expect(@board.valid_coordinate?("A22")).to eq(false)
  end

  it "is a valied placement" do
    expect(@board.valid_placement?(@cruiser, ["A1", "A2", "A3"])).to eq(true)
    expect(@board.valid_placement?(@cruiser, ["A1", "A2"])).to eq(false)
  end
end

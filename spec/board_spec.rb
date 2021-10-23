require './lib/ship'
require './lib/cell'
require './lib/board'

RSpec.describe Board do
  before(:each) do
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new('Submarine', 2)
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

  describe '#valid_coordinate?' do
    it "is a valid coordinate" do
      expect(@board.valid_coordinate?("A1")).to eq(true)
      expect(@board.valid_coordinate?("A22")).to eq(false)
    end
  end

  describe '#valid_placement?' do
    it "is a valid placement" do
      expect(@board.valid_placement?(@cruiser, ["A1", "A2", "A3"])).to eq(true)
      expect(@board.valid_placement?(@cruiser, ["A1", "B1", "C1"])).to eq(true)
      expect(@board.valid_placement?(@cruiser, ["C1", "C3", "C2"])).to eq(true)
      expect(@board.valid_placement?(@submarine, ["C4", "B4"])).to eq(true)
    end

    it 'is not a valid placement' do
      expect(@board.valid_placement?(@cruiser, ["A1", "D2", "D3"])).to eq(false)
      expect(@board.valid_placement?(@cruiser, ["B1", "D3"])).to eq(false)
      expect(@board.valid_placement?(@submarine, ["A1", "B2"])).to eq(false)
      expect(@board.valid_placement?(@submarine, ["A1", "A2", "A4"])).to eq(false)
    end
  end
    it 'places ship' do

      @board.place(@cruiser, ["A1", "D2", "D3"])
      ship_name = @board.cells["A1"].ship.name

      @board.place(@submarine, ["C4", "B4"])
      ship_name_1 = @board.cells["C4"].ship.name

      expect(ship_name).to eq("Cruiser")
      expect(ship_name_1).to eq("Submarine")
    end

    it "does not overlap" do

      @board.place(@cruiser, ["A1", "D2", "D3"])

      expect(@board.valid_placement?(@submarine, ["D3", "D4"])).to eq(false)

    end
end

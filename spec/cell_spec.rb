require './lib/cell'


describe Cell do
  before(:each) do
    @cell = Cell.new('B4')
  end

  describe '#initialize' do
    it 'creates an instance of Cell' do
      expect(@cell).to be_a(Cell)
    end

    it 'has a coordinate' do
      expect(@cell.coordinate).to eq 'B4'
    end
  end

  describe '#ship' do
    it 'returns nil if no ship occupies the cell' do
      expect(@cell.ship).to eq(nil)
    end
    # Alter to return a Ship object
    it 'returns a ship object' do
      expect(@cell.ship('Ship')).to eq('Ship')
    end
  end

end

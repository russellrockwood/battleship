require './lib/cell'
require './lib/ship'


describe Cell do
  before(:each) do
    @cell_1 = Cell.new('B4')
    @ship_1 = Ship.new('Cruiser', 3)
  end

  describe '#initialize' do
    it 'creates an instance of Cell' do
      expect(@cell_1).to be_a(Cell)
    end

    it 'has a coordinate' do
      expect(@cell_1.coordinate).to eq('B4')
    end
  end

  describe '#ship' do
    it 'returns nil if no ship occupies the cell' do
      expect(@cell_1.ship).to eq(nil)
    end

    it 'returns ship object in the cell' do
      @cell_1.place_ship(@ship_1)
      expect(@cell_1.ship).to be_a(Ship)
    end
  end

  describe '#empty' do
    it 'determines if the cell is empty' do
      expect(@cell_1.empty?).to eq(true)
    end
    it 'determines if a ship occupies the cell' do
      @cell_1.place_ship(@ship_1)
      expect(@cell_1.empty?).to eq(false)
    end
  end

  describe '#fire_upon' do
    it 'reduces ship health' do
      @cell_1.place_ship(@ship_1)
      @cell_1.fire_upon
      expect(@cell_1.ship.health).to eq(2)
    end
  end

  describe '#fired_upon?' do
    it 'determines if the cell has been hit' do
      expect(@cell_1.fired_upon?).to eq(false)
    end
  end

  describe '#render' do
    it 'has a ship' do
      @cell_1.place_ship(@ship_1)
      expect(@cell_1.render(true)).to eq('S')
    end

    it 'returns correct string for cell not fired upon' do
      expect(@cell_1.render).to eq('.')
    end

    it "returns a miss string" do
      @cell_1.fire_upon
      expect(@cell_1.render).to eq('M')
    end

    it 'returns a hit string' do
      @cell_1.place_ship(@ship_1)
      @cell_1.fire_upon
      expect(@cell_1.render).to eq('H')
    end

    it 'returns correct string for sunken ship' do
      @cell_1.place_ship(@ship_1)
      @cell_1.fire_upon
      @cell_1.fire_upon
      @cell_1.fire_upon
      expect(@cell_1.render).to eq('X')
    end

  end

end

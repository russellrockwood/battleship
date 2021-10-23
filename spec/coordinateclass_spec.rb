require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/coordinateclass'

RSpec.describe CoordinatesClass do
  before(:each) do
    @boardcoords_1 = CoordinatesClass.new(['A1', 'A3', 'A2'])
    @boardcoords_2 = CoordinatesClass.new(['A1', 'A2', 'A3'])
    @boardcoords_1.sort_elements
    @boardcoords_2.sort_elements
  end

  it "exists" do
    expect(@boardcoords_1).to be_instance_of(CoordinatesClass)
  end

  # it "has valid coordinates" do
  #   expect(@boardcoords_1.consecutive_letters).to eq(true)
  #   expect(@boardcoords_2.consecutive_letters).to eq(true)
  #
  # end

  it "does not have valid coordinate" do
    boardcoords_3 = CoordinatesClass.new(['D1','C2','A3'])
    boardcoords_3.sort_elements
    expect(boardcoords_3.consecutive_letters).to eq(false)
  end

end

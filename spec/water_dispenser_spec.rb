require_relative '../lib/water_dispenser'
require_relative '../lib/water_reservoir'


describe 'A water dispenser' do
    let!(:reservoir) { WaterReservoir.new }

    it 'has a reservoir' do
        wata_disp = WaterDispenser.new(reservoir)
        expect(wata_disp.reservoir).to eq(reservoir)
    end

    it 'dispenses water to a vessel' do
        reservoir = WaterReservoir.new(10, 10)
        dispenser = WaterDispenser.new(reservoir)
        vessel = Vessel.new('Cup', 5)
        dispenser.dispense(vessel)
        expect(reservoir.current_water_volume).to eq(5)
    end
end

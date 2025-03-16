require_relative '../lib/refrigerator'

describe 'A refrigerator' do
    let!(:chiller) { Chiller.new}
    let!(:freezer) { Freezer.new }
    let!(:wata_res) { WaterReservoir.new }
    let!(:wata_disp) { WaterDispenser.new(wata_res) }
    let!(:refrigerator) { Refrigerator.new(chiller, freezer, wata_disp, wata_res) }
    let!(:chill_item) { Item.new('Apples', 5) }
    let!(:freeze_item) { Item.new('Otterpops', 5) }

    it 'has a chiller, freezer, dispenser, and reservoir' do
        expect(refrigerator.chiller).to eq(chiller)
        expect(refrigerator.freezer).to eq(freezer)
        expect(refrigerator.water_dispenser).to eq(wata_disp)
        expect(refrigerator.water_reservoir).to eq(wata_res)
    end

    it 'starts powered off' do
        expect(refrigerator.power).to eq(:off)
    end

    describe 'methods' do

        describe 'chill' do
            it 'adds an item to the chiller' do
                refrigerator.chill(chill_item)
                expect(refrigerator.chiller.remaining_capacity).to eq(95)
            end
        end

        describe 'freeze' do
            it 'adds an item to the freezer' do
                refrigerator.freeze(freeze_item)
                expect(refrigerator.freezer.remaining_capacity).to eq(95)
            end
        end

        describe 'total capacity' do
            it 'returns the capacity of chiller and freezer' do
                refrigerator.chill(chill_item)
                refrigerator.freeze(freeze_item)
                expect(refrigerator.remaining_capacity).to eq(190)
            end
        end

        describe 'plug_in' do
            it 'powers on the chiller and freezer' do
                refrigerator.plug_in
                expect(refrigerator.power).to eq(:on)
                expect(refrigerator.chiller.power).to eq(:on)
                expect(refrigerator.freezer.power).to eq(:on)
            end
        end

        describe 'unplug' do
            it 'powers off the chiller and freezer' do
                refrigerator.unplug
                expect(refrigerator.power).to eq(:off)
                expect(refrigerator.chiller.power).to eq(:off)
                expect(refrigerator.freezer.power).to eq(:off)
            end
        end

        describe 'set_chiller_level' do
            it 'sets the chillers temp' do
                refrigerator.set_chiller_level(2)
                expect(refrigerator.chiller.temperature).to eq(60)
            end
        end

        describe 'set_freezer_level' do
            it 'sets the freezer temp' do
                refrigerator.set_freezer_level(2)
                expect(refrigerator.freezer.temperature).to eq(50)
            end
        end

        describe 'to_s' do
            it 'returns the status of the refrigerator in a string' do
            expected_output = <<~STATUS
                Power: off
                Storage: 200 of 200 available
                Temps: Chiller is 70, Freezer is 70
                Water: Reservoir has 10 remaining.
            STATUS
          
              expect(refrigerator.to_s).to eq(expected_output)
            end
        end
    end
end

require_relative '../lib/water_reservoir'

describe 'A water reservoir' do
    let!(:wata_res) {WaterReservoir.new}

    it 'has a capacity and initial_water_volume' do
        expect(wata_res.capacity).to eq(10)
        expect(wata_res.current_water_volume).to eq(10)
    end

    describe 'empty?' do

        context 'when empty' do
            it 'returns true' do
                wata_res.drain(10)
                expect(wata_res.empty?).to eq(true)
            end
        end

        context 'when not empty' do
            it 'returns false' do
                wata_res = WaterReservoir.new(10, 10)
                expect(wata_res.empty?).to eq(false)
            end
        end
    end

    describe 'fill' do
        it 'sets current_water_volume to capacity' do
            wata_res.fill
            expect(wata_res.current_water_volume).to eq(10)
        end
    end

    describe 'drain' do
        context 'when there will still be water in the reservoir' do
            it 'decrements current_water_volume by volume arg' do
                wata_res.fill
                wata_res.drain(9)
                expect(wata_res.current_water_volume).to eq(1)
            end
        end

        context 'when the volume drained is greater than the reservoir' do
            it 'sets the current_water_volume to 0' do
                wata_res.fill
                wata_res.drain(12)
                expect(wata_res.current_water_volume).to eq(0)
            end
        end
    end   
end

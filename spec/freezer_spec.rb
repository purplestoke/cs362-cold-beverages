require_relative '../lib/freezer'

describe 'A freezer' do
    let!(:freezer) { Freezer.new }

    it 'has a capacity and temp, and capacity' do
        expect(freezer.capacity).to eq(100)
        expect(freezer.temperature).to eq(Freezer::ROOM_TEMPERATURE)
        expect(freezer.contents).to eq([])
    end

    it 'starts powered off' do
        expect(freezer.power).to eq(:off)
    end

    it 'turns on' do
        freezer.turn_on
        expect(freezer.power).to eq(:on)
    end

    it 'turns off' do
        freezer.turn_on
        freezer.turn_off
        expect(freezer.power).to eq(:off)
    end

    it 'adds an item' do
        item = Item.new('Apples', 5)
        freezer.add(item)
        expect(freezer.contents).to eq([item])
    end

    it 'returns the remaining capacity' do
        item = Item.new('Apples', 5)
        freezer.add(item)
        expect(freezer.remaining_capacity).to eq(95)
    end

    it 'sets the level' do
        freezer.set_level(2)
        expect(freezer.temperature).to eq(50)
    end

end

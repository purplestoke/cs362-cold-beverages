require_relative '../lib/chiller'

describe 'A chiller' do

    it 'has a capacity, temp and contents' do
        chiller = Chiller.new
        expect(chiller.capacity).to eq(100)
        expect(chiller.temperature).to eq(Chiller::ROOM_TEMPERATURE)
        expect(chiller.contents).to eq([])
    end

    it 'is initially off' do
        chiller = Chiller.new
        expect(chiller.power).to eq(:off)
    end

    it 'powers on and off' do
        chiller = Chiller.new
        chiller.turn_on
        expect(chiller.power).to eq(:on)
        chiller.turn_off
        expect(chiller.power).to eq(:off)
    end

    it 'adds an item' do
        chiller = Chiller.new
        item = Item.new('Apples', 5)
        chiller.add(item)
        expect(chiller.contents).to eq([item])
    end

    it 'returns remaining capacity' do
        chiller = Chiller.new
        item = Item.new('Apples', 5)
        chiller.add(item)
        expect(chiller.remaining_capacity).to eq(95)
    end

    it 'sets the temperature' do
        chiller = Chiller.new
        chiller.set_level(2)
        expect(chiller.temperature).to eq(60)
    end
end

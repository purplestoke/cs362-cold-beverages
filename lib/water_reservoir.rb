class WaterReservoir

  attr_reader :capacity
  attr_accessor :current_water_volume

  def initialize(capacity = 10, initial_water_volume = 0)
    @capacity = capacity
    @current_water_volume = initial_water_volume
    self.fill
  end

  def empty?
    current_water_volume == 0
  end

  def fill
    self.current_water_volume = capacity
  end

  def drain(volume)
    self.current_water_volume -= volume
    self.current_water_volume = 0 if current_water_volume < 0
  end

end

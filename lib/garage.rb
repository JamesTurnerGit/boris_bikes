class Garage
  attr_accessor :stored_bikes
  attr_accessor :fixed_bikes
  def initialize
    @stored_bikes = []
    @fixed_bikes = []
  end

  def pickup_bikes
    bikes_transit = @fixed_bikes
    @fixed_bikes = []
    bikes_transit
  end
end

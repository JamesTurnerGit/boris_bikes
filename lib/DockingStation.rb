require_relative 'bike'

class DockingStation
  DEFAULT_CAPACITY = 20

  attr_reader :capacity
  attr_reader :stored_bikes
  attr_reader :broken_bikes

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @stored_bikes = []
    @broken_bikes = []
  end

  def release_bike
    empty?
    @stored_bikes.pop
  end

  def dock(bike)
    full?
    @stored_bikes << bike
  end

  def report_broken
    @broken_bikes << @stored_bikes.pop
  end

  def pickup_bikes
    bikes_transit = @broken_bikes
    @broken_bikes = []
    bikes_transit
  end

  private
  def total_bikes
    stored_bikes.count + broken_bikes.count
  end

  def full?
    fail "Dock full" if  total_bikes >= capacity
  end

  def empty?
    fail "No bikes present" if stored_bikes.empty?
  end

end

require_relative 'bike'

class DockingStation
  DEFAULT_CAPACITY = 20

  attr_reader :bikes
  attr_reader :capacity
  attr_reader :broken_bikes

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
    @broken_bikes = []
  end

  def release_bike
    empty?
    @bikes.pop
  end

  def dock(bike)
    full?
    @bikes << bike
  end

  def report_broken
    @broken_bikes << @bikes.pop
  end

  private

  def full?
    fail "Dock full" if @bikes.count >= @capacity
  end

  def empty?
    fail "No bikes present" if @bikes.empty?
  end
end

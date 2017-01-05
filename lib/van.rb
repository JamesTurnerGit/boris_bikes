class Van

    attr_reader :bikes_transit

    def initialize
      @bikes_transit = []
    end

    def get_broken_bikes dockingStation
      @bikes_transit = dockingStation.pickup_bikes
    end

    def drop_bikes garage
      garage.bike_store = @bikes_transit
      @bikes_transit = []
    end
end

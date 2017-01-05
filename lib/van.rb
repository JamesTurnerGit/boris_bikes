class Van

    attr_reader :bikes_transit

    def initialize
      @bikes_transit = []
    end

    def get_bikes station
      @bikes_transit = station.pickup_bikes
    end

    def drop_bikes garage
      garage.stored_bikes = @bikes_transit
      @bikes_transit = []
    end
end

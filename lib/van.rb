class Van
    def initialize
      @bikes_transit = nil
    end
    
    def get_broken_bikes dockingStation
      @bikes_transit = dockingStation.pickup_bikes
    end
end

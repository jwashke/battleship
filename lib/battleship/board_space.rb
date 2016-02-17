module Battleship
  class BoardSpace
    attr_reader :ship

    def initialize
      @ship = nil
      @miss = false
      @hit = false
    end

    def has_miss?
      @miss
    end

    def has_hit?
      @hit
    end

    def place_ship(ship)
      @ship = ship
    end

    def check_hit
      if has_ship?
        hit
      else
        miss
      end
    end

    def has_ship?
      if @ship == nil
        false
      else
        true
      end
    end

    private

    def miss
      @miss = true
      :miss
    end

    def hit
      @hit = true
      @ship.get_hit
    end
  end
end

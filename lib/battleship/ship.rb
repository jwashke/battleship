module Battleship
  class Ship

    attr_reader :health,
                :hits

    def initialize(health)
      @health = health
      @hits   = 0
    end

    def sunk?
      @hits >= @health
    end

    def get_hit
      @hits += 1
      check_sunk_or_hit
    end

    private

    def check_sunk_or_hit
      sunk? ? :sunk : :hit
    end
  end
end

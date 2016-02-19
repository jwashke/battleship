require_relative 'game'

module Battleship
  class Battleship
    def initialize
      @game = Game.new
    end
  end
end

Battleship::Battleship.new

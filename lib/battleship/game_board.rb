require_relative 'board_space'
require_relative 'ship.rb'

module Battleship
  class GameBoard
    attr_reader :board

    def initialize(player)
      @player     = player
      @board      = setup_game_board
      @ships_sunk = 0
    end

    def place_ship(ship_size, coordinates)
      ship = Battleship::Ship.new(ship_size)
      coordinates.each do |coordinate|
        place_ship_in_board_space(coordinate, ship)
      end
    end

    def get_shot_coordinates
      result = fire_shot(@player.get_coordinate)
      evaluate(result)
    end

    #private

    def setup_game_board
      empty_board = create_empty_board
      empty_board.map do |array|
        push_new_board_objects_onto_board(array)
      end
      empty_board
    end

    def create_empty_board
      [[],[],[],[]]
    end

    def push_new_board_objects_onto_board(array)
      4.times do
        array.push(BoardSpace.new)
      end
    end

    def place_ship_in_board_space(coordinate, ship)
      @board[coordinate.first][coordinate.last].place_ship(ship)
    end

    def fire_shot(coordinate)
      @board[coordinate.first][coordinate.last].check_hit
    end

  end
end

module Battleship
  class Player
    def initialize
      @coordinates_hash = coordinates_hash
      @valid = false
    end

    def place_ship
      @valid = false
      until valid
        coordinates = @player_input.get_input
        valid_placement = validate_ship_placement(coordinates)
      end
      valid_placement
    end

    def get_shot_coordinates
      @valid = false
      until valid
        coordinates = @player_input.get_input
        @valid = validate_coordinates(coordinates)
      end
      convert_coordinates(coordinates)
    end

    def split_and_convert_ship_coordinates(coordinates)
      coordinate_array = coordinates.split
      convert_ship_coordinates(coordinate_array)
    end

    def validate_coordinates(coordinates)
      if coordinates =~ /[AaBbCcDd][1234]/
        true
      else
        puts "please enter valid coordinates"
      end
    end

    def convert_shot_coordinates(coordinates)
      @coordinates_hash[coordinates]
    end

    def convert_ship_coordinates(coordinates)
      coordinates.map do |element|
        @coordinates_hash[element]
      end
    end

    def coordinates_hash
      { "A1" => [0, 0], "A2" => [0, 1], "A3" => [0, 2], "A4" => [0, 3],
        "B1" => [1, 0], "B2" => [1, 1], "B3" => [1, 2], "B4" => [1, 3],
        "C1" => [2, 0], "C2" => [2, 1], "C3" => [2, 2], "C4" => [2, 3],
        "D1" => [3, 0], "D2" => [3, 1], "D3" => [3, 2], "D4" => [3, 3]
      }
    end
  end
end

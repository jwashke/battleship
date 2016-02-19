require_relative 'player_input'

module Battleship
  class Player
    def initialize
      @coordinates_hash = coordinates_hash
      @player_input     = PlayerInput.new
      @valid            = false
      @size_3_array     = ship_size_3_array
      @shot_array       = shot_array
    end

    def place_ship(size)
      print_message(size)
      @valid = false
      until @valid
        coordinates = @player_input.get_input
        validate_ship_placement(coordinates, size)
        unless @valid
          print "\nPlease enter valid coordinates that
          do not already contain a ship\n"
        end
      end
      convert_ship_coordinates(coordinates.split(" "))
    end

    def get_shot_coordinates
      @valid = false
      until @valid
        coordinates = @player_input.get_input
        @valid = validate_coordinates(coordinates)
      end
      @shot_array.delete(coordinates)
      convert_shot_coordinates(coordinates)
    end

    def split_and_convert_ship_coordinates(coordinates)
      coordinate_array = coordinates.split
      convert_ship_coordinates(coordinate_array)
    end

    def validate_coordinates(coordinates)
      if coordinates =~ /[AaBbCcDd][1234]/ && @shot_array.include?(coordinates)
        true
      else
        puts "please enter valid coordinates that you have not yet entered"
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

    def validate_ship_placement(coordinates, size)
      if size == 2
        @valid = ship_size_2_array.include?(coordinates)
        remove_ship_spots_from_ship_3_array(coordinates) if @valid
      else
        @valid = @size_3_array.include?(coordinates)
      end
    end

    def remove_ship_spots_from_ship_3_array(string)
      strings = string.split(" ")
      @size_3_array.delete_if do |coordinate|
        coordinate = coordinate.split(" ")
        if coordinate.include? strings[0]
          true
        elsif coordinate.include? strings[1]
          true
        else
          false
        end
      end
    end

    def print_message(size)
      print "\n\nEnter the squares for the #{size} unit ship:"
    end

    def ship_size_2_array
      ["A1 A2", "A2 A3", "A3 A4", "B1 B2", "B2 B3", "B3 B4",
       "C1 C2", "C2 C3", "C3 C4", "D1 D2", "D2 D3", "D3 D4",
       "A1 B1", "B1 C1", "C1 D1", "A2 B2", "B2 C2", "C2 D2",
       "A3 B3", "B3 C3", "C3 D3", "A4 B4", "B4 C4", "C4 D4"]
     end

    def coordinates_hash
      { "A1" => [0, 0], "A2" => [1, 0], "A3" => [2, 0], "A4" => [3, 0],
        "B1" => [0, 1], "B2" => [1, 1], "B3" => [2, 1], "B4" => [3, 1],
        "C1" => [0, 2], "C2" => [1, 2], "C3" => [2, 2], "C4" => [3, 2],
        "D1" => [0, 3], "D2" => [1, 3], "D3" => [2, 3], "D4" => [3, 3]
      }
    end

    def ship_size_3_array
      ["A1 A2 A3", "A2 A3 A4", "B1 B2 B3", "B2 B3 B4",
       "C1 C2 C3", "C2 C3 C4", "D1 D2 D3", "D2 D3 D4",
       "A1 B1 C1", "B1 C1 D1", "A2 B2 C2", "B2 C2 D2",
       "A3 B3 C3", "B3 C3 D3", "A4 B4 C4", "B4 C4 D4"]
     end

     def shot_array
       ["A1", "A2", "A3", "A4",
        "B1", "B2", "B3", "B4",
        "C1", "C2", "C3", "C4",
        "D1", "D2", "D3", "D4"]
     end
  end
end

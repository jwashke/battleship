require_relative 'player_input'
require_relative 'hash_container'

module Battleship
  class Player
    
    def initialize
      @player_input     = PlayerInput.new
      @valid            = false
      @hash_container   = HashContainer.new
      @shot_array       = @hash_container.shot_array
      @size_3_array     = @hash_container.ship_size_3_array
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
      @hash_container.coordinates_hash[coordinates]
    end

    def convert_ship_coordinates(coordinates)
      coordinates.map do |element|
        @hash_container.coordinates_hash[element]
      end
    end

    def validate_ship_placement(coordinates, size)
      if size == 2
        @valid = @hash_container.ship_size_2_array.include?(coordinates)
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
  end
end

require_relative 'hash_container'

module Battleship
  class CPUInput

    attr_reader :size_3_array

    def initialize
      @hash_container = HashContainer.new
      @shot_array   = @hash_container.shot_array.shuffle
      @size_2_array = @hash_container.ship_size_2_array.shuffle
      @size_3_array = @hash_container.ship_size_3_array.shuffle
    end

    def place_ship(size)
      case size
      when 2
        place_size_2_ship
      when 3
        place_size_3_ship
      end
    end

    def get_shot_coordinates
      convert_shot_coordinates(@shot_array.pop)
    end

    private

    def place_size_2_ship
      coordinate = @size_2_array.pop.split(" ")
      iterate_through_size_3_array_to_remove_ship(coordinate)
      convert_ship_coordinates(coordinate)
    end

    def place_size_3_ship
      convert_ship_coordinates(@size_3_array.pop.split(" "))
    end

    def convert_ship_coordinates(coordinates)
      coordinates.map do |element|
        @hash_container.coordinates_hash[element]
      end
    end

    def convert_shot_coordinates(coordinates)
      @hash_container.coordinates_hash[coordinates]
    end

    def iterate_through_size_3_array_to_remove_ship(string)
      @size_3_array.delete_if do |coordinate|
        remove_ship_from_size_3_array(coordinate, string)
      end
    end

    def remove_ship_from_size_3_array(coordinate, string)
      coordinate = coordinate.split(" ")
      if coordinate.include? string[0]
        true
      elsif coordinate.include? string[1]
        true
      else
        false
      end
    end
  end
end

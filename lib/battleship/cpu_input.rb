module Battleship
  class CPUInput
    attr_reader :size_3_array
    def initialize
      @coordinates_hash = coordinates_hash
      @shot_array   = shot_array.shuffle
      @size_2_array = ship_size_2_array.shuffle
      @size_3_array = ship_size_3_array.shuffle
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

    def place_size_2_ship
      coordinate = @size_2_array.pop
      remove_ship_spots_from_ship_3_array(coordinate)
      convert_ship_coordinates(coordinate.split(" "))
    end

    def place_size_3_ship
      convert_ship_coordinates(@size_3_array.pop.split(" "))
    end

    def convert_ship_coordinates(coordinates)
      coordinates.map do |element|
        @coordinates_hash[element]
      end
    end

    def convert_shot_coordinates(coordinates)
      coordinates_hash[coordinates]
    end

    def coordinates_hash
      { "A1" => [0, 0], "A2" => [1, 0], "A3" => [2, 0], "A4" => [3, 0],
        "B1" => [0, 1], "B2" => [1, 1], "B3" => [2, 1], "B4" => [3, 1],
        "C1" => [0, 2], "C2" => [1, 2], "C3" => [2, 2], "C4" => [3, 2],
        "D1" => [0, 3], "D2" => [1, 3], "D3" => [2, 3], "D4" => [3, 3]
      }
    end

    def shot_array
      ["A1", "A2", "A3", "A4",
       "B1", "B2", "B3", "B4",
       "C1", "C2", "C3", "C4",
       "D1", "D2", "D3", "D4"]
    end

    def ship_size_2_array
      ["A1 A2", "A2 A3", "A3 A4", "B1 B2", "B2 B3", "B3 B4",
       "C1 C2", "C2 C3", "C3 C4", "D1 D2", "D2 D3", "D3 D4",
       "A1 B1", "B1 C1", "C1 D1", "A2 B2", "B2 C2", "C2 D2",
       "A3 B3", "B3 C3", "C3 D3", "A4 B4", "B4 C4", "C4 D4"]
     end

     def ship_size_3_array
       ["A1 A2 A3", "A2 A3 A4", "B1 B2 B3", "B2 B3 B4",
        "C1 C2 C3", "C2 C3 C4", "D1 D2 D3", "D2 D3 D4",
        "A1 B1 C1", "B1 C1 D1", "A2 B2 C2", "B2 C2 D2",
        "A3 B3 C3", "B3 C3 D3", "A4 B4 C4", "B4 C4 D4"]
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
  end
end
#
# cpu = Battleship::CPUInput.new
#
# puts cpu.get_ship_placement(2)
# puts cpu.get_ship_placement(3)
# print cpu.size_3_array

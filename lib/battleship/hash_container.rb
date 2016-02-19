module Battleship
  class HashContainer

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

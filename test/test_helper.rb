require 'simplecov'
SimpleCov.start
require 'minitest'
require 'minitest/autorun'

class TestHelper
  def size_two_ship
    [[0,0],[1,0]]
  end

  def size_three_ship
    [[0,0],[1,0],[2,0]]
  end

  def coordinates_hash
    { "A1" => [0, 0], "A2" => [1, 0], "A3" => [2, 0], "A4" => [3, 0],
      "B1" => [0, 1], "B2" => [1, 1], "B3" => [2, 1], "B4" => [3, 1],
      "C1" => [0, 2], "C2" => [1, 2], "C3" => [2, 2], "C4" => [3, 2],
      "D1" => [0, 3], "D2" => [1, 3], "D3" => [2, 3], "D4" => [3, 3]
    }
  end

end

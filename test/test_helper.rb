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

end

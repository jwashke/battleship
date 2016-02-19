require_relative 'test_helper'
require_relative '../lib/battleship/player'
require_relative '../lib/battleship/board_space'

class PlayerTest < Minitest::Test
  def setup
    @player = Battleship::Player.new
    @test_helper = TestHelper.new
  end

  def test_it_has_a_coordinates_hash
    assert_equal @test_helper.coordinates_hash, @player.coordinates_hash
  end

  def test_it_can_validate_coordinates
    assert @player.validate_coordinates("A1")
  end

  def test_it_can_return_nil_coordinates_are_invalid
    assert_equal nil, @player.validate_coordinates("Q5")
  end

  def test_it_can_convert_shot_coordinates
    assert_equal [0, 0], @player.convert_shot_coordinates("A1")
  end

  def test_it_can_split_and_convert_ship_placement_coordinates
    assert_equal @test_helper.size_two_ship, @player.split_and_convert_ship_coordinates("A1 A2")
  end
end

class Battleship::Player
  public :split_and_convert_ship_coordinates,
         :validate_coordinates,
         :coordinates_hash,
         :convert_shot_coordinates
end

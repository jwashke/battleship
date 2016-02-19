require_relative 'test_helper'
require_relative '../lib/battleship/cpu_input'
require_relative '../lib/battleship/hash_container'

class CPUInputTest < Minitest::Test
  def setup
    @cpu  = Battleship::CPUInput.new
    @test_helper = TestHelper.new
  end

  def test_it_can_get_a_set_of_two_adjacent_coordinates
    assert_equal [[3, 2], [3, 3]], @cpu.place_ship(2)
  end

  def test_it_can_remove_coordinates_containing_the_size_3_ship
    @cpu.place_ship(2)
    assert_equal @test_helper.size_3_array_removed, @cpu.size_3_array
  end

  def test_it_can_get_a_set_of_three_adjacent_coordinates
    assert_equal [[3, 1], [3, 2], [3, 3]], @cpu.place_ship(3)
  end

  def test_it_can_get_shot_coordinate
    assert_equal [3, 3], @cpu.get_shot_coordinates
  end

  def test_it_removes_popped_shots_from_shot_array
    @cpu.get_shot_coordinates
    assert_equal @test_helper.shot_array_removed, @cpu.shot_array
  end
end

class Battleship::CPUInput
  attr_reader :size_3_array,
              :shot_array

  def initialize
    @hash_container = Battleship::HashContainer.new
    @shot_array   = @hash_container.shot_array
    @size_2_array = @hash_container.ship_size_2_array
    @size_3_array = @hash_container.ship_size_3_array
  end
end

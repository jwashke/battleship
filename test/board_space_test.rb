require_relative 'test_helper'
require '..lib/battleship/board_space'
require '..lib/battleship/ship'

class BoardSpaceTest < Minitest::Test
  def setup
    @board_space = Battleship::BoardSpace.new
    @ship = Battleship::Ship.new
    @mock = MiniTest::Mock.new
  end

  def test_it_can_have_a_ship
    @board_space.place_ship(@ship)
    assert_equal @ship, @board_space.ship
  end

  def test_its_ship_defaults_to_nil
    assert_equal nil, @board_space.ship
  end

  def test_it_can_return_true_if_it_has_ship
    @board_space.place_ship(@ship)
    assert @board_space.has_ship?
  end

  def test_it_returns_false_if_it_doesnt_have_a_ship
    refute @board_space.has_ship?
  end

  def test_two_board_spaces_can_hold_the_same_ship
    board_space2 = Battleship::BoardSpace.new
    board_space2.place_ship(@ship)
    @board_space.place_ship(@ship)
    assert @board_space.ship.equal?(board_space2.ship)
  end

  def test_it_can_have_a_miss
    @board_space.check_hit
    assert @board_space.has_miss?
  end

  def test_its_has_miss_defaults_to_false
    refute @board_space.has_miss?
  end

  def test_it_can_have_a_hit
    @board_space.place_ship(ship)
    @board_space.check_hit
    assert @board_space.has_hit?
  end

  def test_its_has_hit_defaults_to_false
    refute @board_space.has_hit?
  end

  def test_check_hit_returns_miss_if_it_doesnt_have_a_ship
    assert_equal :miss, @board_space.check_hit
  end

  def test_check_hit_returns_hit_if_a_ship_was_hit
    @board_space.place_ship(@ship)
    assert_equal :hit, @board_space.check_hit
  end

  def test_check_hit_returns_sunk_if_a_ship_was_sunk
    @mock.expect(sunk?, true)
    @board_space.place_ship(@mock)
    assert_equal :sunk, @board_space.check_hit
  end
end

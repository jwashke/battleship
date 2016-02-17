require_relative 'test_helper'
require_relative '../lib/battleship/ship'

class ShipTest < Minitest::Test
  def setup
    @ship = Battleship::Ship.new(2)
  end

  def test_it_has_a_health_value
    assert_equal 2, @ship.health
  end

  def test_it_has_a_hits_value
    assert_equal 0, @ship.hits
  end

  def test_it_can_return_its_not_sunk
    refute  @ship.sunk?
  end

  def test_it_can_return_its_not_sunk_after_getting_hit
    @ship.get_hit
    refute @ship.sunk?
  end

  def test_it_can_return_its_sunk
    @ship.get_hit
    @ship.get_hit
    assert @ship.sunk?
  end

  def test_it_can_get_hit
    @ship.get_hit
    assert_equal 1, @ship.hits
  end

  def test_it_can_return_it_was_hit_when_hit
    assert_equal :hit, @ship.get_hit
  end

  def test_it_can_return_sunk_when_sunk
    assert_equal :hit, @ship.get_hit
    assert_equal :sunk, @ship.get_hit
  end
end

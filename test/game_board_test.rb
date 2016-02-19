require_relative 'test_helper'
require_relative '../lib/battleship/game_board'
require_relative '../lib/battleship/board_space'
require_relative '../lib/battleship/player'

class GameBoardTest < Minitest::Test
  def setup
    @game_board  = Battleship::GameBoard.new(Battleship::Player.new)
    @test_helper = TestHelper.new
  end

  def test_it_has_a_player_object

  end

  def test_it_has_a_game_board_array
    assert_equal Array, @game_board.board.class
  end

  def test_its_game_board_is_full_of_board_spaces
    @game_board.board.each do |inner_array|
      inner_array.each do |board_space|
        assert_equal Battleship::BoardSpace, board_space.class
      end
    end
  end

  def test_it_can_place_a_size_two_ship
    @game_board.place_ship(2, @test_helper.size_two_ship)
    assert @game_board.board[0][0].has_ship?
    assert @game_board.board[0][1].has_ship?
  end

  def test_it_can_place_the_same_ship_in_two_places
    @game_board.place_ship(2, @test_helper.size_two_ship)
    assert @game_board.board[0][0].ship.equal?(@game_board.board[0][1].ship)
  end

  def test_it_can_place_a_size_three_ship
    @game_board.place_ship(3, @test_helper.size_three_ship)
    assert @game_board.board[0][0].has_ship?
    assert @game_board.board[0][1].has_ship?
    assert @game_board.board[0][2].has_ship?
  end

  def test_it_can_place_the_same_ship_in_three_places
    @game_board.place_ship(3, @test_helper.size_three_ship)
    assert @game_board.board[0][0].ship.equal?(@game_board.board[0][1].ship)
    assert @game_board.board[0][1].ship.equal?(@game_board.board[0][2].ship)
    assert @game_board.board[0][2].ship.equal?(@game_board.board[0][0].ship)
  end

  def test_a_fired_shot_will_return_miss_on_an_empty_square
    assert_equal :miss, @game_board.fire_shot([0,0])
  end

  def test_a_fired_shot_will_return_hit_on_a_square_with_a_ship_in_it
    @game_board.place_ship(2, @test_helper.size_two_ship)
    assert_equal :hit, @game_board.fire_shot([0,0])
  end

  def test_a_fired_shot_will_return_sunk_if_it_sinks_a_ship
    @game_board.place_ship(2, @test_helper.size_two_ship)
    @game_board.fire_shot([0,1])
    assert_equal :sunk, @game_board.fire_shot([0,0])
  end
end

require_relative 'test_helper'
require_relative '../lib/battleship/game_board'
require_relative '../lib/battleship/board_space'

class GameBoardTest < Minitest::Test
  def setup
    @game_board = Battleship::GameBoard.new
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
    skip
    @game_board.place_ship(2, "A1 A2")
    assert @game_board.board[0][0].has_ship?
    assert @game_board.board[1][0].has_ship?
  end

  def test_it_can_place_the_same_ship_in_two_places
    skip
    @game_board.place_ship(2, "A1 A2")
    assert @game_board.board[0][0].equal?(@game_board.board[1][0])
  end

  def test_it_can_place_a_size_three_ship
    skip
    @game_board.place_ship(3, "A1 A2 A3")
    assert @game_board.board[0][0].has_ship?
    assert @game_board.board[1][0].has_ship?
    assert @game_board.board[2][0].has_ship?
  end

  def test_it_can_place_the_same_ship_in_three_places
    skip
    @game_board.place_ship(3, "A1 A2 A3")
    assert @game_board.board[0][0].equal?(@game_board.board[2][0])
    assert @game_board.board[1][0].equal?(@game_board.board[0][0])
    assert @game_board.board[2][0].equal?(@game_board.board[1][0])
  end

  def test_a_fired_shot_will_return_miss_on_an_empty_square
    skip
    assert_equal :miss, @game_board.fire_shot("A1")
  end

  def test_a_fired_shot_will_return_hit_on_a_square_with_a_ship_in_it
    skip
    @game_board.place_ship(2, "A1 A2")
    assert_equal :hit, @game_board.fire_shot("A1")
  end

  def test_a_fired_shot_will_return_sunk_if_it_sinks_a_ship
    skip
    @game_board.place_ship(2, "A1 A2")
    @game_board.fire_shot("A2")
    assert_equal :sunk, @game_board.fire_shot("A1")
  end
end

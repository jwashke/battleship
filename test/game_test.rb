require_relative 'test_helper'
require_relative '../lib/battleship/game'

class GameTest < Minitest::Test
  def setup
    @game_board  = Battleship::GameBoard.new
    @test_helper = TestHelper.new
  end
end

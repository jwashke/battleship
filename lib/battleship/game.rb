require_relative 'game_board'
require_relative 'player_input'
require_relative 'cpu_input'
require_relative 'printer'

module Battleship
  class Game
    def initialize
      @game_over    = true
      @printer      = Printer.new
      @player_board = GameBoard.new(Player.new)
      @cpu_board    = GameBoard.new(CPUPlayer.new)
      main_game_loop
    end

    def main_game_loop
      game_setup
      until @game_over
        game_turn
      end
      game_end
    end

    def game_setup
      computer_place_ships
      player_place_ships
      @game_over = false
    end

    def game_turn
      results = @player_board.get_shot_coordinates
      evaluate(results)
      results = @cpu_board.get_shot_coordinates
      evaluate(results)
    end

    def game_end
      printer.print_game_end
    end

    def evaluate

    end
  end
end

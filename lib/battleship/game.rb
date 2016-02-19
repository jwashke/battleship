require_relative 'game_board'
require_relative 'player'
require_relative 'cpu_input'
require_relative 'printer'
require 'pry'

module Battleship
  class Game
    def initialize
      @game_over    = true
      @printer      = Printer.new
      @player_board = GameBoard.new
      @cpu_board    = GameBoard.new
      @player       = Player.new
      @cpu          = CPUInput.new
      @player_score = 0
      @cpu_score    = 0
      @player_shots = 0
      @cpu_shots    = 0
      welcome
    end

    private

    def welcome
      loop do
        @printer.print_welcome
        input = @player.get_start_command
        break if opening_menu(input) == 0
      end
    end

    def opening_menu(input)
      if input == 'i' || input == 'instructions'
        @printer.print_instructions
      elsif input == 'q' || input == 'quit'
        0
      elsif input == 'p' || input == 'play'
        main_game_loop
      end
    end

    def main_game_loop
      game_setup
      until @game_over
        game_turn
      end
      game_end
    end

    def game_setup
      @time_start = Time.now
      computer_place_ships
      player_place_ships
      @game_over = false
    end

    def game_turn
      results = @cpu_board.get_shot_coordinates(@cpu)
      evaluate_cpu(results)
      @printer.print_shot
      results = @player_board.get_shot_coordinates(@player)
      evaluate_player(results)
    end

    def game_end
      player = :cpu
      shots = @cpu_shots
      if @player_score >= 2
        player = :player
        shots = @player_shots
      end
      @printer.print_game_end(player, shots, Time.now - @time_start)
    end

    def computer_place_ships
      @player_board.place_ship(2, @cpu)
      @player_board.place_ship(3, @cpu)
    end

    def player_place_ships
      @printer.print_ship_placement
      player_print_board_then_place_ship(2)
      player_print_board_then_place_ship(3)
    end

    def player_print_board_then_place_ship(size)
      @printer.print_board(@cpu_board, true)
      @cpu_board.place_ship(size, @player)
    end


    def evaluate_cpu(results)
      @cpu_score += 1 if results == :sunk
      @printer.print_cpu_results(results, @cpu_board)
      @game_over = true if @cpu_score >= 2
      @cpu_shots += 1
    end

    def evaluate_player(results)
      @player_score += 1 if results == :sunk
      @printer.print_player_results(results, @player_board)
      @game_over = true if @player_score >= 2
      @player_shots += 1
    end
  end
end

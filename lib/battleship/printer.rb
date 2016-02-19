require_relative 'game_board'
require 'pry'

module Battleship
  class Printer

    def print_welcome
      print "Welcome to BATTLESHIP\n\n
      Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
    end

    def print_ship_placement
      print "\nI have laid out my ships on the grid.
      \nYou now need to layout your two ships.
      \nThe first is two units long and the
      \nsecond is three units long.
      \nThe grid has A1 at the top left and D4 at the bottom right.\n"
    end

    def print_shot
      print "\n\nYour turn."
      print "\nEnter the coordinate for your shot."
    end

    def print_player_results(result, board)
      #binding.pry
      case result
      when :hit
        print "\nYou hit an enemy ship!\n"
      when :sunk
        print "\nYou sunk an enemy ship!\n"
      when :miss
        print "\nYou missed!\n"
      end
      print_board(board, false)
      print "\nPress enter to end your turn\n"
      gets
    end

    def print_board(board, show_ships)
      print_ships = show_ships
      print "\n==========="
      print "\n   A B C D\n"
      counter = 1
      board.board.each do |array|
        array.each_with_index do |board_space, index|
          print "#{counter}  " if index == 0
          if board_space.has_hit?
            print "H "
          elsif board_space.has_ship? && print_ships
            print "X "
          elsif board_space.has_miss?
            print "M "
          else
            print "  "
          end
        end
        counter += 1
        print "\n"
      end
      print "==========="
    end

    def print_cpu_results(result, board)
      print "\n\nThe Computers turn\n"
      case result
      when :hit
        print "\nThe computer hit your ship!\n"
      when :sunk
        print "\nThe computer sunk one of your ships!\n"
      when :miss
        print "\nThe computer missed!\n"
      end
      print_board(board, true)
    end

    def print_game_end(winner, shots, time)
      if winner == :player
        print "\n\nCongratulations! You beat the computer in #{time} seconds with #{shots} shots\n\n"
      else
        print "\n\nSorry! The computer beat you in #{time} seconds with #{shots} shots\n\n"
      end
    end
  end
end

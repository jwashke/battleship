require_relative 'game_board'

module Battleship
  class Printer

    def initialize(board)
      @board = board
    end
    def print_welcome
      print "Welcome to BATTLESHIP\n\n
      Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
    end

    def print_ship_placement
      print "\nI have laid out my ships on the grid.
      \nYou now need to layout your two ships.
      \nThe first is two units long and the
      \nsecond is three units long.
      \nThe grid has A1 at the top left and D4 at the bottom right.

      \n\nEnter the squares for the two-unit ship:"
    end

    def print_results(result)
      case result
      when :hit
        print "You hit an enemy ship!"
      when :sunk
        print "You sunk an enemy ship!"
      when :miss
        print "You missed!"
      end
    end

    def print_board(board)
      print "  A B C D\n"
      counter = 1
      @board.board.each do |array|
        array.each_with_index do |board_space, index|
          print "#{counter}  " if index == 0
          if board_space.has_hit?
            print "H "
          elsif board_space.has_miss?
            print "M "
          else
            print "  "
          end
        end
        counter += 1
        print "\n"
      end
    end
  end
end

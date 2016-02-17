require_relative 'board_space'

module Battleship
  class GameBoard
    attr_reader :board

    def initialize
      @board = setup_game_board
    end

    def setup_game_board
      empty_board = [[],[],[],[]]
      empty_board.map do |array|
        push_new_board_objects_onto_board(array)
      end
      empty_board
    end

    def push_new_board_objects_onto_board(array)
      4.times do
        array.push(BoardSpace.new)
      end
    end
  end
end

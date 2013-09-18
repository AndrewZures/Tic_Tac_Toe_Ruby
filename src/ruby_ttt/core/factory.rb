require_relative './players/computer_ai'
require_relative './players/human_player'
require_relative './boards/two_dimensional_board'
require_relative './boards/three_dimensional_board'
require_relative './game'

class Factory

    def get_board (board_type)
        case board_type
        when "three_by_three" then TwoDimensionalBoard.new 3
        when "four_by_four" then TwoDimensionalBoard.new 4
        when "five_by_five" then TwoDimensionalBoard.new 5
        when "cube_three" then ThreeDimensionalBoard.new 3
        else raise "unknown board type"
        end
    end

    def get_player (player_type, symbol, opponent, name)
        case player_type
        when "human" then HumanPlayer.new(symbol, opponent, name)
        when "easy_ai" then ComputerAI.new(symbol, opponent, 10, name)
        when "medium_ai" then ComputerAI.new(symbol, opponent, 50, name)
        when "unbeatable_ai" then ComputerAI.new(symbol, opponent, 100, name)
        else raise "unknown player type"
        end
    end

    def get_game (id, board, player1, player2)
        Game.new(id, board, player1, player2)
    end
end



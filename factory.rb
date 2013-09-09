require 'ruby_ttt/computer_ai'
require 'ruby_ttt/human_player'
require 'ruby_ttt/two_dimensional_board'
require 'ruby_ttt/three_dimensional_board'
require 'ruby_ttt/game'

class Factory

    def get_board board_type
        case board_type
        when "three_by_three" then TwoDimensionalBoard.new 3
        when "four_by_four" then TwoDimensionalBoard.new 4
        when "five_by_five" then TwoDimensionalBoard.new 5
        when "cube_three" then ThreeDimensionalBoard.new 3
        end
    end

    def get_player player_type, symbol
        case player_type
        when "human" then HumanPlayer.new(symbol)
        when "easy_ai" then ComputerAI.new(symbol, 10)
        when "medium_ai" then ComputerAI.new(symbol, 50)
        when "unbeatable_ai" then ComputerAI.new(symbol, 100)
        end
    end

    def get_game id, board, player1, player2
        Game.new(id, board, player1, player2)
    end
end



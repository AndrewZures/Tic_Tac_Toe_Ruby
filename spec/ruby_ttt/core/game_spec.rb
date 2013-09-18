require_relative '../../../src/ruby_ttt/core/factory'
require_relative '../../../src/ruby_ttt/core/game'

describe Game do

    let(:factory){f = Factory.new}
    let(:human_player){ factory.get_player("human", "O", "X", "player1")}
    let(:ai_player){ factory.get_player("unbeatable_ai","X", "O", "player2")}
    let(:second_ai){ factory.get_player("unbeatable_ai", "O", "X", "player1")}
    let(:board){ factory.get_board("three_by_three")}
    let(:human_first_game){ Game.new('id_1',board, human_player, ai_player)}
    let(:ai_first_game){ Game.new('id_1', board, ai_player, second_ai)}

    it 'should build game correctly' do
        human_first_game.player1.should == human_player
        human_first_game.player2.should == ai_player
        human_first_game.current_player.should == human_player
    end

    it 'should run game loop' do
        value = human_first_game.run_game_loop("player1", 4)
        board.get_open_spots.length.should == 7
        value.should == true
    end

    it 'score an ai move' do
        human_first_game.run_game_loop("player1", 2)
        board.get_open_spots.length.should == 7
    end


    it 'should run completely if two ais are players' do
        ai_first_game.run_game_loop("player1", 1)
        board.get_open_spots.length.should == 0
    end


end

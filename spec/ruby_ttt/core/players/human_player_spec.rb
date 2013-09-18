require_relative '../ruby_ttt_spec_helper'

describe HumanPlayer do

    let(:human_player){hp = HumanPlayer.new(:x, :o, 'player1')}
    let(:board){board = TwoDimensionalBoard.new(3)}

    describe '#make_move' do

        it 'makes valid move' do
            board.stub(:record_move){true}
            human_player.make_move(board)
        end
    end
end

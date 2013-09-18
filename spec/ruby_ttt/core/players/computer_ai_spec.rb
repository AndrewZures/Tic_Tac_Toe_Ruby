require_relative '../ruby_ttt_spec_helper'

describe ComputerAI do

    let(:board) { TwoDimensionalBoard.new 3}
    let(:ai) { ComputerAI.new("O", "X", 100, 'player1')}

    describe '#make_move' do

        it 'takes win if available' do
            test_board = ["X","O","X",
                          :open,"O",:open,
                          :open,:open,"X"]
            board.instance_variable_set(:@board_array,test_board)
            ai.make_move(board).should == 7

            test_board = ["X",:open,"X",
                          "O","O",:open,
                          :open,:open,"X"] 
            board.instance_variable_set(:@board_array,test_board)
            ai.make_move(board).should == 5

            test_board = ["X",:open,"X",
                          :open,"O","O",
                          "X",:open,:open] 
            board.instance_variable_set(:@board_array,test_board)
            ai.make_move(board).should == 3

            test_board = ["O","X","X",
                          "X","O",:open,
                          :open,:open,:open]
            board.instance_variable_set(:@board_array,test_board)
            ai.make_move(board).should == 8 
        end

        it 'takes win' do
            test_board = ["X","O","X",
                          "X",:open,:open,
                          :open,"O",:open]
            board.instance_variable_set(:@board_array,test_board)
            ai.make_move(board).should == 4 

        end

      it 'defends against immediate loss' do
            test_board = ["X",:open,:open,
                          :open,:open,"O",
                          "X",:open,:open] 
            board.instance_variable_set(:@board_array,test_board)
            ai.make_move(board).should == 3

            test_board = ["X",:open,"X",
                          :open,:open,:open,
                          :open,:open,:open]
            board.instance_variable_set(:@board_array,test_board)
            ai.make_move(board).should == 1
        end
    end
end

require_relative '../ruby_ttt_spec_helper'

describe ComputerAI do
    let(:ai) { ComputerAI.new(:o, :x, 100);}
    let(:second_ai){ ComputerAI.new(:x, :o, 100);}
    let(:board_3x3) { TwoDimensionalBoard.new 3}
    let(:board_4x4) { TwoDimensionalBoard.new 4}
    let(:board_5x5) { TwoDimensionalBoard.new 5}
    let(:board_3x3x3) { ThreeDimensionalBoard.new 3}

    describe '#five_by_five_board' do

        it 'takes win if available' do
            test_board = [:x,:o,:x,:open,:open,
                          :open,:o,:open,:open,:open,
                          :open,:o,:open,:x,:open,
                          :open, :o,:open,:open,:open,
                          :open,:open,:open,:open,:open]
            board_5x5.instance_variable_set(:@board_array,test_board)
            ai.make_move(board_5x5).should == 21

            test_board = [:o,:o,:o,:o,:open,
                          :x,:x,:x,:x,:open,
                          :open,:open,:open,:open,:open,
                          :open,:open,:open,:open,:open,
                          :open,:open,:open,:open,:open]
            board_5x5.instance_variable_set(:@board_array,test_board)
            ai.make_move(board_5x5).should == 4

            test_board = [:o,:open,:open,:open,:open,
                          :x,:o,:x,:x,:open,
                          :open,:open,:o,:open,:open,
                          :open,:open,:open,:o,:open,
                          :open,:open,:open,:open,:open]
            board_5x5.instance_variable_set(:@board_array,test_board)
            ai.make_move(board_5x5).should == 24

        end

        it 'defends against immediate loss' do
            test_board = [:x,:x,:x,:x,:open,
                          :x,:o,:open,:open,:open,
                          :open,:open,:o,:open,:open,
                          :open,:open,:open,:o,:o,
                          :open,:open,:open,:open,:open]
            board_5x5.instance_variable_set(:@board_array,test_board)
            ai.make_move(board_5x5).should == 4

            test_board = [:x,:open,:open,:open,:open,
                          :x,:o,:open,:open,:open,
                          :x,:open,:o,:open,:open,
                          :x,:open,:open,:o,:o,
                          :open,:open,:open,:open,:open]
        board_5x5.instance_variable_set(:@board_array,test_board)
            ai.make_move(board_5x5).should == 20
        end

        it 'provides different indices if no single best option' do
            test_board = [:open,:open,:open,:open,:open,
                          :open,:open,:open,:open,:open,
                          :open,:open,:open,:open,:open,
                          :open,:open,:open,:open,:open,
                          :open,:open,:open,:open,:open]

            test_results = []
            10.times do
                board_5x5.instance_variable_set(:@board_array,test_board)
                test_results << ai.make_move(board_5x5)
            end
            test_results.uniq.size.should > 1
        end

    end

    describe '#cube_three_board' do

        it 'takes win if available' do
            test_board = [:open,:open,:open,
                          :x,:open,:open,
                          :open,:open,:x,

                          :open,:open,:open,
                          :open,:open,:open,
                          :open,:open,:open,

                          :open,:open,:open,
                          :open,:open,:open,
                          :o,:o,:open]
            board_3x3x3.instance_variable_set(:@board_array,test_board)
            ai.make_move(board_3x3x3).should == 26

            test_board = [:x,:x,:open,
                          :open,:o,:open,
                          :open,:open,:open,

                          :open,:open,:open,
                          :open,:o,:open,
                          :open,:open,:open,

                          :open,:open,:open,
                          :open,:open,:open,
                          :open,:open,:open]
            board_3x3x3.instance_variable_set(:@board_array,test_board)
            ai.make_move(board_3x3x3).should == 22
        end

    end

    it 'defends against immediate loss' do
            test_board = [:o,:open,:open,
                          :open,:open,:open,
                          :open,:open,:open,

                          :open,:open,:open,
                          :open,:open,:open,
                          :open,:open,:open,

                          :open,:open,:open,
                          :open,:open,:open,
                          :open,:x,:x]
            board_3x3x3.instance_variable_set(:@board_array,test_board)
            ai.make_move(board_3x3x3).should == 24

            test_board = [:open,:o,:open,
                          :open,:x,:open,
                          :open,:open,:open,

                          :open,:open,:open,
                          :open,:x,:open,
                          :open,:open,:open,

                          :open,:open,:open,
                          :open,:open,:open,
                          :open,:o,:open]
            board_3x3x3.instance_variable_set(:@board_array,test_board)
            ai.make_move(board_3x3x3).should == 22
    end

    describe '#four_by_four_board' do

        it 'takes win if available' do
            test_board = [:x,:o,:x,:open,
                          :open,:o,:open,:open,
                          :open,:o,:open,:x,
                          :open,:open,:open,:open]
            board_4x4.instance_variable_set(:@board_array,test_board)
            ai.make_move(board_4x4).should == 13

            test_board = [:o,:o,:o,:open,
                          :x,:x,:x,:open,
                          :open,:open,:open,:open,
                          :open,:open,:open,:open]
            board_4x4.instance_variable_set(:@board_array,test_board)
            ai.make_move(board_4x4).should == 3

            test_board = [:x,:x,:x,:open,
                          :o,:o,:o,:open,
                          :open,:open,:open,:open,
                          :open,:open,:open,:open]
            board_4x4.instance_variable_set(:@board_array,test_board)
            ai.make_move(board_4x4).should == 7

            test_board = [:o,:x,:x,:open,
                          :x,:o,:o,:open,
                          :open,:open,:o,:open,
                          :open,:open,:open,:open]
            board_4x4.instance_variable_set(:@board_array,test_board)
            ai.make_move(board_4x4).should == 15

        end

        it 'defends against immediate loss' do

            test_board = [:x,:x,:x,:open,
                          :o,:o,:open,:open,
                          :o,:open,:open,:open,
                          :open,:open,:open,:open]
            board_4x4.instance_variable_set(:@board_array,test_board)
            ai.make_move(board_4x4).should == 3

            test_board = [:open,:open,:open,:open,
                          :o,:o,:x,:open,
                          :o,:x,:open,:open,
                          :x,:open,:open,:open]
            board_4x4.instance_variable_set(:@board_array,test_board)
            ai.make_move(board_4x4).should == 3
        end
    end

    describe '#discrete situation testing' do

        it 'pits two ai against each other on 3x3 board' do
          board = run_game_loop(board_3x3, ai, second_ai, 0)
          board.check_board_status.should == :tie
        end

        it 'pits two ai against each other on 4x4 board' do
          board = run_game_loop(board_4x4, ai, second_ai, 0)
          board.check_board_status.should == :tie
        end

        it 'pits two ai against each other on 5x5 board' do
          board = run_game_loop(board_5x5, ai, second_ai, 0)
          board.check_board_status.should == :tie
        end

    end

    def run_game_loop(board, player1, player2, starting_player)
      if starting_player == 0
       player = player1.symbol
      else player = player2.symbol end

        while board.check_board_status == :continue_game
          if player == player1.symbol
              board.record_move(player1.make_move(board), player1.symbol)
          else
              board.record_choice(player2.make_move(board), player2.symbol)
          end
          player = opponent(player)
        end
       board
    end

    def opponent player
        if player == :x then :o else :x end
    end
end

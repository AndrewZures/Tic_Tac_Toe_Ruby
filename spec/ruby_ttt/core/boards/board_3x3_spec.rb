require_relative '../ruby_ttt_spec_helper'

describe TwoDimensionalBoard do

    let(:board) {b = TwoDimensionalBoard.new 3}

    describe TwoDimensionalBoard do

		it "creates empty board of size 9" do
            open_spots = board.get_open_spots
			open_spots.size.should == 9
		end	
	end

	describe '#check_for_tie' do 

		it "scores a tie" do
            board.check_for_tie.should == :continue_game
            board.instance_variable_set(:@board_array, Array.new(9,:taken))
			board.check_for_tie.should == :tie
		end
	end
    
	describe '#check_row_win' do

		it "scores row win" do
			test_board = [:x,:x,:open, :open,:open,:open, :open,:open,:open]
			board.check_rows_for_win(test_board).should == :continue_game

			test_board = [:x,:open,:open, :x,:open,:open, :x,:open,:open]
            board.check_rows_for_win(test_board).should ==:continue_game 

			test_board = [:x,:x,:x, :open,:open,:open, :open,:open,:open]
			board.check_rows_for_win(test_board).should == :x 

			test_board = [:open,:open,:open, :o,:o,:o, :open,:open,:open]
            board.check_rows_for_win(test_board).should == :o 

			test_board = [:open,:open,:open, :open,:open,:open, :o,:o,:o]
			board.check_rows_for_win(test_board).should == :o 
		end
	end

	describe '#check_columns_for_win' do

		it "scores column win" do
			test_board = [:open,:open,:open, :open,:open,:open, :o,:o,:o]
			board.check_columns_for_win(test_board).should == :continue_game

			test_board = [:o,:open,:open, :o,:open,:open, :o,:open,:open]
			board.check_columns_for_win(test_board).should == :o 

			test_board = [:open,:x,:open, :open,:x,:open, :open,:x,:open]
            board.check_columns_for_win(test_board).should == :x
		end
	end

	describe '#check_bottom_top_diagonal' do

		it "scores bottom top diag win" do
			test_board = [:x,:open,:open, :x,:open,:open, :open,:open,:open]
			board.check_bottom_top_diagonal(test_board).should == :continue_game

			test_board = [:open,:open,:x, :open,:x,:open, :x,:open,:open]
			board.check_bottom_top_diagonal(test_board).should == :x
		end
	end

	describe '#check_top_bottom_diagonal' do

		it "scores top bottom diag win" do
			test_board = [:x,:open,:open, :open,:x,:open, :open,:open,:open]
			board.check_top_bottom_diagonal(test_board).should == :continue_game

			test_board = [:x,:open,:open, :open,:x,:open, :open,:open,:x]
			board.check_top_bottom_diagonal(test_board).should == :x
        end

        it "tests full board" do
            test_board = [:x,:o,:x, :x,:x,:o, :o,:o,:x]
            board.check_top_bottom_diagonal(test_board).should == :x

		end
	end

    describe '#special test cases' do
        
        it "scores win" do
			test_board = [:x,:open,:open, :x,:open,:o, :x,:open,:open]
            board.instance_variable_set(:@board_array,test_board)
            board.check_board_status.should == :x 
        	
            test_board = [:x,:x,:open, :open,:open,:o, :x,:o,:open]
            board.instance_variable_set(:@board_array,test_board)
            board.check_board_status.should == :continue_game

        end

        it "scores a win" do
            test_board = [:x,:o,:x, :x,:open,:open, :o,:o,:open]
            board.instance_variable_set(:@board_array,test_board)
            board.check_board_status.should == :continue_game
        end

    end

end

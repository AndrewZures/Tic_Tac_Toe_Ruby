require_relative '../ruby_ttt_spec_helper'

describe TwoDimensionalBoard do

    let(:board) {b = TwoDimensionalBoard.new 5}

	describe "#initialize" do

		it "creates empty board of size :continue_game5" do
            open_spots = board.get_open_spots
			open_spots.size.should == 25 
		end	
	end

	describe '#check_for_tie' do 

		it "scores a tie" do
            board.check_for_tie.should == :continue_game
            board.instance_variable_set(:@board_array, Array.new(25,:taken))
            board.check_for_tie.should == :tie
		end
	end

	describe '#check_row_win' do

		it "scores row win" do
			test_board = [:x,:x,:x,:x,:open, :open,:open,:open,:x,:open, :open,:open,:open,:x,:open, :open,:open,:open,:open,:x, :open,:open,:open,:open,:open]
			board.check_rows_for_win(test_board).should == :continue_game

			test_board = [:x,:x,:x,:open,:open, :open,:open,:x,:x,:open, :open,:open,:open,:x,:open, :open,:x,:open,:open,:x, :open,:open,:open,:open,:open]
			board.check_rows_for_win(test_board).should == :continue_game

			test_board = [:x,:x,:x,:x,:x, :open,:open,:x,:x,:open, :open,:open,:open,:x,:open, :open,:x,:open,:open,:x, :open,:open,:open,:open,:open]
			board.check_rows_for_win(test_board).should == :x
		end
	end

	describe '#check_columns_for_win' do

		it "scores column win" do
			test_board = [:x,:open,:open,:open,:open, :x,:open,:open,:open,:open, :x,:open,:open,:open,:open, :open,:open,:open,:open,:open, :open,:open,:open,:open,:open]
			board.check_columns_for_win(test_board).should == :continue_game

			test_board = [:x,:open,:open,:open,:open, :x,:open,:open,:open,:open, :x,:open,:open,:open,:open, :x,:open,:open,:open,:open, :x,:open,:open,:open,:open]
			board.check_columns_for_win(test_board).should == :x

			test_board = [:open,:x,:open,:open,:open, :open,:x,:open,:open,:open, :open,:x,:open,:open,:open, :open,:x,:open,:open,:open, :open,:x,:open,:open,:open]
			board.check_columns_for_win(test_board).should == :x
		end
	end

	describe '#check_bottom_top_diagonal' do

		it "scores bottom top diag win" do
			test_board = [:open,:x,:open,:open,:open, :open,:x,:open,:open,:open, :open,:x,:open,:open,:open, :open,:x,:open,:open,:open, :open,:x,:open,:open,:open]
			board.check_bottom_top_diagonal(test_board).should == :continue_game

			test_board = [:open,:open,:open,:open,:x, :open,:open,:open,:x,:open, :open,:open,:x,:open,:open, :open,:x,:open,:open,:open, :x,:open,:open,:open,:open]
			board.check_bottom_top_diagonal(test_board).should == :x
		end
	end

	describe '#check_top_bottom_diagonal' do

		it "scores top bottom diag win" do
			test_board = [:x,:open,:open,:open,:open, :open,:x,:open,:open,:open, :open,:open,:x,:open,:open, :open,:open,:open,:x,:open, :open,:open,:open,:open,:open]
			board.check_top_bottom_diagonal(test_board).should == :continue_game

			test_board = [:x,:open,:open,:open,:open, :open,:x,:open,:open,:open, :open,:open,:x,:open,:open, :open,:open,:open,:x,:open, :open,:open,:open,:open,:x]
			board.check_top_bottom_diagonal(test_board).should == :x
		end
	end
end

require_relative '../ruby_ttt_spec_helper'

describe ThreeDimensionalBoard do

	let(:board){b = ThreeDimensionalBoard.new 3}
    let(:test_board) {b = Array.new(27, :open)}

	it 'creates array of size 27' do
        open_spots = board.get_open_spots
        open_spots.size.should == 27
	end

	it 'scores a tie' do
        board.check_for_tie.should == :continue_game
		test_board.fill(:taken)
        board.instance_variable_set(:@board_array,test_board)
		board.check_for_tie.should == :tie
	end

	it 'scores a row win' do
		test_board[26] = :x; test_board[25] = :x; test_board[24] = :x
        board.instance_variable_set(:@board_array,test_board)
		board.check_rows_for_win(test_board).should == :x

        test_board.fill(:open)
		test_board[0] = :o; test_board[1] = :o; test_board[2] = :o
		board.check_rows_for_win(test_board).should == :o

        test_board.fill(:open)
        test_board[18] = :x; test_board[21] = :x; test_board[24] = :x
        board.check_rows_for_win(test_board) == :x

	end

	it 'scores column win' do
		test_board[20] = :x; test_board[22] = :x; test_board[26] = :x
		board.check_column_win(test_board).should == :continue_game 

		test_board[20] = :x; test_board[23] = :x; test_board[26] = :x
		board.check_column_win(test_board).should == :x

		test_board.fill(:open)
		test_board[9] = :o; test_board[12] = :o; test_board[15] = :o
		board.check_column_win(test_board).should == :o
	end

	it 'scores top->bot diagonal win' do
		test_board[9] = :x; test_board[13] = :x
		board.check_top_bottom_diagonal(test_board).should == :continue_game

		test_board[9] = :x; test_board[13] = :x; test_board[17] = :x
		board.check_top_bottom_diagonal(test_board).should == :x
	
		test_board.fill(:open)
		test_board[18] = :o; test_board[22] = :o; test_board[26] = :o
		board.check_top_bottom_diagonal(test_board).should == :o
	end

	it 'scores bot->top diagonal win' do
		test_board[24] = :x; test_board[22] = :x
		board.check_bottom_top_diagonal(test_board).should == :continue_game

		test_board[20] = :x
		board.check_bottom_top_diagonal(test_board).should == :x

		test_board.fill(:open)
		test_board[15] = :x; test_board[13] = :x
		board.check_bottom_top_diagonal(test_board).should == :continue_game

		test_board[11] = :x
		board.check_bottom_top_diagonal(test_board).should == :x

		test_board.fill(:open)
		test_board[6] = :x; test_board[4] = :x; test_board[2] = :x
		board.check_bottom_top_diagonal(test_board).should == :x
	end

	it 'scores three_dim row win' do
		test_board[8] = :x; test_board[17] = :x
		board.check_front_to_back_row_win(test_board).should == :continue_game 

		test_board[26] = :x
		board.check_front_to_back_row_win(test_board).should == :x

		test_board.fill(:open)
		test_board[4] = :o; test_board[13] = :o
		board.check_front_to_back_row_win(test_board).should == :continue_game

		test_board[22] = :o
		board.check_front_to_back_row_win(test_board).should == :o
	end

	it 'scores horizontal_left_right_diagonal_check' do
		test_board[3] = :x; test_board[13] = :x
		board.horizontal_left_right_diagonal_check(test_board).should == :continue_game

		test_board[23] = :x
		board.horizontal_left_right_diagonal_check(test_board).should == :x
	end

	it 'scores horizontal_right_left_diagonal_check' do
		test_board[5] = :x; test_board[13] = :x
		board.horizontal_right_left_diagonal_check(test_board).should == :continue_game

		test_board[21] = :x
		board.horizontal_right_left_diagonal_check(test_board).should == :x
	end

	it 'scores vertical_top_bottom_diagonal_check' do
		test_board[1] = :x; test_board[13] = :x
		board.vertical_top_bottom_diagonal_check(test_board).should == :continue_game

		test_board[25] = :x
		board.vertical_top_bottom_diagonal_check(test_board).should == :x
	end

	it 'scores vertical_bottom_top_diagonal_check' do
		test_board[7] = :x; test_board[13] = :x
		board.vertical_bottom_top_diagonal_check(test_board).should == :continue_game

		test_board[19] = :x
		board.vertical_bottom_top_diagonal_check(test_board).should == :x
	end

	it 'scores angled_through_center_diagonals_check' do
		test_board[0] = :x; test_board[13] = :x
		board.angled_through_center_diagonals_check(test_board).should == :continue_game 

		test_board[26] = :x
		board.angled_through_center_diagonals_check(test_board).should == :x

		test_board.fill(:open)

		test_board[8] = :x; test_board[13] = :x
		board.angled_through_center_diagonals_check(test_board).should == :continue_game

		test_board[18] = :x
		board.angled_through_center_diagonals_check(test_board).should == :x		
	end

    describe '#check_board_status' do

        it 'returns win if there is a column win' do
            board.stub(:check_column_win){:x}
            board.check_board_status.should == :x
        end

        it 'returns win if there is a row win' do
            board.stub(:check_rows_for_win){:o}
            board.check_board_status.should == :o
        end

        it 'return win if there is a diag win' do
            board.stub(:check_diagonal_wins){:x}
            board.check_board_status.should == :x
        end

        it 'return tie if no win and board is full' do
            board.stub(:check_for_tie){:tie}
            board.check_board_status.should == :tie
        end
    end

    describe '#check_diagonal_wins' do

        it 'returns win if check bottom top diag win' do
            board.stub(:check_top_bottom_diagonal){:x}
            board.check_diagonal_wins(board).should == :x
        end

    end
end

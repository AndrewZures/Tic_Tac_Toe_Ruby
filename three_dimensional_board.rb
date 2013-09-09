require "ruby_ttt/board"

class ThreeDimensionalBoard < Board

    def initialize size
       @board_array = Array.new(size**3, :open)
       @row_length = size
       @row_length_squared = size**2
    end

	def get_print_results
		#row length needed to show correct 2d version of @board_array array
		[@board_array, 3]
	end

    def get_type
        :three_dimensional_board
    end

	def check_board_status
		result = :continue_game
		if (column_result = check_column_win(@board_array)) != :continue_game 
			result = column_result
		elsif (row_result = check_rows_for_win(@board_array)) != :continue_game
			result = row_result
		elsif (diag_result = check_diagonal_wins(@board_array)) != :continue_game
			result = diag_result
		elsif (tie_result = check_for_tie) != :continue_game
			result = tie_result
		end
		return result
	end

	def check_column_win board
		start_index = 0
		@row_length.times do
			@row_length.times do
				if board[start_index] != :open
					if board[start_index] == board[start_index + 3] && board[start_index+3] == board[start_index + 6]
						return board[start_index]
					end
				end
				start_index += 1
			end
			start_index += 6
		end
		return :continue_game
	end

	def check_rows_for_win board
		if (result = check_left_right_row_for_win(board)) != :continue_game
			return result
		elsif (result = check_front_to_back_row_win(board)) != :continue_game
			return result
		else return :continue_game end
	end

    def check_left_right_row_for_win board
        for row_number in 0...(@row_length**2)
            row = get_row(row_number, board).uniq
            return row.pop if win_is_found(row)
        end
        :continue_game
    end

    def get_row row_number, board
        start_index = row_number * @row_length
        board.slice(start_index, @row_length)
    end

    def get_front_back_row start_index, board
        board.select.with_index{|x,i| x if (i-start_index) % (@row_length**2) == 0}
    end

    def check_front_to_back_row_win board
        for row_number in 0..(@row_length**2)
            row = get_front_back_row(row_number,board).uniq
            return row.pop if win_is_found(row) 
        end
        :continue_game
    end

	def check_diagonal_wins board
		if (result = check_top_bottom_diagonal(board)) != :continue_game 
			return result
		elsif (result = check_bottom_top_diagonal(board)) != :continue_game
			return result
		elsif (result = horizontal_left_right_diagonal_check(board)) != :continue_game
			return result
		elsif (result = horizontal_right_left_diagonal_check(board)) != :continue_game
			return result
		elsif (result = vertical_top_bottom_diagonal_check(board)) != :continue_game
			return result
		elsif (result = vertical_bottom_top_diagonal_check(board)) != :continue_game
			return result
		elsif (result = angled_through_center_diagonals_check(board)) != :continue_game
			return result 
		else return :continue_game end	
	end



    def check_top_bottom_diagonal board
        for diag_number in 0...@row_length
            index = diag_number*@row_length_squared
            sub_board = board.slice(index, @row_length_squared)
            diagonal = get_top_bottom_diagonal(index, sub_board).uniq
            return diagonal.pop if win_is_found(diagonal)
        end
        :continue_game
    end

    def get_top_bottom_diagonal start_index, board
		board.select.with_index {|x,i| x if i % (@row_length+1) == 0}
    end

	def check_bottom_top_diagonal board
		index = 6
		@row_length.times do
			if board[index] != :open
				if board[index] == board[index-2] && board[index-2] == board[index-4]
					return board[index]
				end
			end
			index += 9
		end
		return :continue_game
	end

	def horizontal_left_right_diagonal_check board
		index = 0
		@row_length.times do
			if board[index] != :open
				if board[index] == board[index+10] && board[index+10] == board[index+20]
					return board[index]
				end
			end
			index += 3
		end
		return :continue_game
	end

	def horizontal_right_left_diagonal_check board
		index = 2
		@row_length.times do
			if board[index] != :open
				if board[index] == board[index+8] && board[index+8] == board[index+16]
					return board[index]
				end
			end
			index += 3
		end
		return :continue_game
	end

	def vertical_top_bottom_diagonal_check board
		index = 0
		@row_length.times do
			if board[index] != :open
				if board[index] == board[index+12] && board[index+12] == board[index+24]
					return board[index]
				end
			end
			index += 1
		end
		return :continue_game
	end

	def vertical_bottom_top_diagonal_check board
		index = 6
		@row_length.times do
			if board[index] != :open
				if board[index] == board[index+6] && board[index+6] == board[index+12]
					return board[index]
				end
			end
			index += 1
		end
		return :continue_game
	end

	def angled_through_center_diagonals_check board
		#scores diagonals starting at a front corner, angling through center,
		#ending at back, opposite corner of cube
		if board[0] != :open && board[0] == board[13] && board[13] == board[26]
			return board[0]
		elsif board[2] != :open && board[2] == board[13] && board[13] == board[24]
			return board[2]
		elsif board[6] != :open && board[6] == board[13] && board[13] == board[20]
			return board[6]
		elsif board[8] != :open && board[8] == board[13] && board[13] == board[18]
			return board[8]
		end
		return :continue_game
	end

end

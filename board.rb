class Board

    attr_reader :row_length, :board_array

    def get_print_results
		#row length d because
		#it is needed to show correct 2d version of @board_array array
		[@board_array, @row_length]
    end
    
    def get_open_spots
        open_spots = []
        @board_array.each_index {|index| open_spots << index if @board_array[index] == :open}
        open_spots
    end

    def remove_choice choice
        @board_array[choice] = :open if valid_choice? choice 
    end

	def record_choice choice, player
		if valid_choice?(choice) && @board_array[choice] == :open
            @board_array[choice] = player
			return true
		else return false end
	end

	def valid_choice? choice
		choice = choice.to_i
		if choice >= 0 && choice <= @board_array.length
		return true else return false end
	end

    def game_over?
        if check_board_status == :continue_game
        return false else return true end
    end

    def get_winner
        check_board_status
    end

    #deprecated, write tests for board_is_full?
	def check_for_tie
		if @board_array.include?(:open) then return :continue_game else return :tie end
	end

    def win_is_found a
         a.size == 1 && !a.include?(:open)
    end

    def board_is_full?
        !@board_array.include?(:open)
    end

end

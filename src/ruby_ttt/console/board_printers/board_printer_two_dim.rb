class BoardPrinterTwoDim

	def initialize output= STDOUT
		@output = output
	end

    def print print_results
		board = print_results[0]
		row_length = print_results[1]

		board.to_enum.with_index.each do |value, index|
			symbol = get_element_symbol board, index

			if symbol.to_s.size == 1
				@output.print "  #{symbol}"
			else
				@output.print " #{symbol}"
			end

			@output.puts "" if (index+1) % row_length == 0 && (index+1) != (row_length * row_length)
		end
		@output.puts "\n \n"
	end

	def get_element_symbol board_array, index
		case board_array[index]
		when :x then symbol = "X"
		when :o then symbol = "O"
		else symbol = index end
		symbol
	end
end

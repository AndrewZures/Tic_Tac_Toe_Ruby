class BoardPrinterThreeDim

	def initialize output= STDOUT
		@output = output
	end

	def print print_results
		board = print_results[0]
		row_length = print_results[1].to_i

		start_index = 0
		row_length.times do
			index = start_index
			row_length.times do
				row_length.times do
					symbol = get_element_symbol board, index
					if symbol.to_s.size == 1
						@output.print "  #{symbol} "
					else
						@output.print " #{symbol} "
					end
					index += 1
				end
				@output.print "   "
				index += 6
			end
			@output.puts 
			start_index += row_length
		end
        @output.puts
	end

	def get_element_symbol board_array, index
		case board_array[index]
		when :x then symbol = "X"
		when :o then symbol = "O"
		else symbol = index end
		symbol
	end
end

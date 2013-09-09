require "ruby_ttt/board"

class TwoDimensionalBoard < Board

  def initialize size
    @board_array = Array.new(size**2, :open)
    @row_length = size
  end

  def get_type
    :two_dimensional_board
  end

  def check_board_status
    a = [check_columns_for_win(@board_array), check_rows_for_win(@board_array),
         check_top_bottom_diagonal(@board_array), check_bottom_top_diagonal(@board_array)]
    a.delete(:continue_game)
    if a.size > 0 then
      return a.pop
    elsif board_is_full? then
      return :tie
    else
      return :continue_game
    end
  end

  def check_rows_for_win board
    for row_number in 0...@row_length
      row = get_row(row_number, board).uniq
      return row.pop if win_is_found(row)
    end
    :continue_game
  end

  def get_row row_number, board
    start_index = row_number * @row_length
    board.slice(start_index, @row_length)
  end

  def check_columns_for_win board
    for column_number in 0...@row_length
      column = get_column(column_number, board).uniq
      return column.pop if win_is_found(column)
    end
    :continue_game
  end

  def get_column start_index, board
    board.select.with_index { |x, i| x if (start_index-i) % @row_length == 0 }
  end

  def check_top_bottom_diagonal board
    diagonal = get_top_bottom_diagonal(board).uniq
    return diagonal.pop if win_is_found(diagonal)
    :continue_game
  end

  def get_top_bottom_diagonal board
    board.select.with_index { |x, i| x if i % (@row_length+1) == 0 }
  end

  def check_bottom_top_diagonal board
    diagonal = get_bottom_top_diagonal(board).uniq
    return diagonal.pop if win_is_found(diagonal)
    :continue_game
  end

  def get_bottom_top_diagonal board
    board.select.with_index { |x, i| x if i % (@row_length-1) == 0 && i != @board_array.length-1 && i != 0 }
  end
end

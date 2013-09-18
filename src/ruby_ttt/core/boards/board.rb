class Board

  attr_reader :row_length, :board_array

  def get_print_results
    [@board_array, @row_length]
  end

  def get_open_spots
    open_spots = []
    @board_array.each_index { |index| open_spots << index if @board_array[index] == :open }
    open_spots
  end

  def remove_move(choice)
    @board_array[choice] = :open if valid_move? choice
  end

  def record_move(choice, player)
    if valid_move?(choice) && @board_array[choice] == :open
      @board_array[choice] = player
      return true
    else
      return false
    end
  end

  def valid_move?(choice)
    choice = choice.to_i
    if choice >= 0 && choice <= @board_array.length
      return true
    else
      return false
    end
  end

  def game_over?
    if check_board_status == :continue_game
      return false
    else
      return true
    end
  end

  def check_for_tie
    if @board_array.include?(:open) then return :continue_game else return :tie end
  end

  def get_winner
    check_board_status
  end

  def win_is_found a
    a.size == 1 && !a.include?(:open)
  end

  def board_is_full?
    !@board_array.include?(:open)
  end

end

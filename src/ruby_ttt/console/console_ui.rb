class ConsoleUI

  def initialize(output= STDOUT)
    @output = output
  end

  def query_user_for_choice user
    @output.puts "User #{user}: Choose!"
    receive_user_choice.to_i
  end

  def query_user_for_new_game
    print_new_game_prompt
    choice = receive_user_choice
    return choice == "y" ? true : false
  end

  def receive_user_choice
    begin
      choice = gets.chomp.downcase
    rescue Interrupt => e
      @output.puts e
    end
    say_goodbye if choice == 'q'
    return choice
  end

  def print_player_move(move, player)
    puts "Player #{player.player} chose #{move}"
  end

  def respond_to_choice(choice_accepted, choice)
    if choice_accepted then @output.puts "You Chose: #{choice}"
    else print_user_input_error end
  end

  def query_user_for_board_type
    valid_choice = false
    while valid_choice == false
      print_board_options
      choice = receive_user_choice.to_i
      valid_choice = validate_board_choice(choice)
      if !valid_choice
        print_user_input_error
      end
    end
    translate_board_type(choice)
  end

  def validate_board_choice choice
    choice >= 0 && choice < 4
  end

  def translate_board_type choice
    case choice
      when 0 then 'three_by_three'
      when 1 then 'four_by_four'
      when 2 then 'five_by_five'
      when 3 then 'cube_three'
    end
  end

  def query_user_for_player_type (player_num)
    valid_choice = false
    while valid_choice == false
      print_player_options(player_num)
      choice = receive_user_choice.to_i
      valid_choice = validate_player_choice(choice)
      if !valid_choice
        print_user_input_error
      end
    end
    translate_player_type_to_string(choice)
  end

  def validate_player_choice choice
    choice >= 0 && choice < 4
  end

  def translate_player_type_to_string (type)
    case type
      when 0 then 'human'
      when 1 then 'easy_ai'
      when 2 then 'medium_ai'
      when 3 then 'unbeatable_ai'
    end
  end

  def print_player_options (player_num)
    @output.puts "Choose Player #{player_num} Type:"
    @output.puts '  Choose 0 for Human'
    @output.puts '  Choose 1 for Easy AI'
    @output.puts '  Choose 2 for Medium AI'
    @output.puts '  Choose 3 for unbeatable AI (Except for 3x3x3)'
  end

  def print_board_options
    @output.puts 'What type of board size would you like to use?'
    @output.puts '   Choose 0 for 3x3 board'
    @output.puts '   Choose 1 for 4x4 board'
    @output.puts '   Choose 2 for 5x5 board'
    @output.puts '   Choose 3 for 3x3x3 board'
  end

  def present_game_result game_result
    if game_result == :tie then @output.puts 'Game Over: Tie'
    else @output.puts "Game Over.  Player #{game_result} Wins" end
  end

  def greet_user
    @output.puts '---Welcome to Tic Tac Toe---'
    @output.puts "Press 'q' at any time to exit game"
  end

  def say_goodbye
    @output.puts 'Thanks for playing!'
    exit
  end

  def print_user_input_error
    @output.puts "Whoops! That choice wasn't valid, try again:"
  end

  def print_new_game_prompt
    @output.puts "Would you like to start another game? Press 'Y' if yes. Press Any Other Key to Exit"
  end

end

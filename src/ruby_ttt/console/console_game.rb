class ConsoleGame

  def initialize(console, factory, console_board_printer_factory)
    @console = console
    @factory = factory
    @board_printer_factory = console_board_printer_factory
  end

  def play
    new_game = true
    while new_game
      @console.greet_user


      game = build_game
      board_printer = @board_printer_factory.get_printer(game.board.get_type)
      game.run_first_game_loop
      while !game.board.game_over?
        move = get_human_player_move(game, board_printer)
        game.run_game_loop(game.current_player.name, move)
      end

      board_printer.print(game.board.get_print_results)
      @console.present_game_result(game.board.check_board_status)

      new_game = @console.query_user_for_new_game
      if (!new_game) then @console.say_goodbye end
    end
  end

  def build_game
    player1 = @factory.get_player(@console.query_user_for_player_type(1), :x, :o, 'player1')
    player2 = @factory.get_player(@console.query_user_for_player_type(2), :o, :x, 'player2')
    board_type = @console.query_user_for_board_type
    board = @factory.get_board(board_type)
    @factory.get_game(1, board, player1, player2)
end

  def get_human_player_move(game, board_printer)
    board_printer.print(game.board.get_print_results)
    @console.query_user_for_choice(game.current_player.symbol)
  end

end



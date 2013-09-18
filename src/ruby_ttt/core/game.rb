class Game

  attr_reader :id, :board, :player1, :player2, :current_player

  def initialize(id, board, player1, player2)
    @id = id
    @board = board
    @player1 = player1
    @player2 = player2
    @current_player = player1
  end

  def run_first_game_loop (loop_flag=true)
    run_game_loop('player1', -1.0/0 , loop_flag)
  end

  def run_game_loop(player_string, move, ai_loop_flag= true)
    player = get_player_object(player_string)
    if player == @current_player
      if player.type == :human
        result = @board.record_move(move, player.symbol)
        if (!result) then return false
        else toggle_current_player end
      end
      if (ai_loop_flag) then make_ai_moves end
      return true
    else return false end
  end

  def correctly_set_up?
    if @id != null && @board != null && @player1 != null && @player2 != null then
      return true
    else return false end
  end

    def make_ai_moves
      while @current_player.type != :human
        if (board.game_over?) then
          break
        end
        move = @current_player.make_move(@board)
        board.record_move(move.to_i, @current_player.symbol)
        toggle_current_player
      end
    end

    def toggle_current_player
      if @current_player == @player1
        @current_player = @player2
      else
        @current_player = @player1
      end
    end

    def get_player_object(player_string)
      if player_string == 'player1' then return @player1
      elsif player_string == 'player2' then return @player2
      else return nil end
    end
  end

class ComputerAI

    MIN_ALPHA = -1.0/0
    MAX_BETA = 1.0/0
    TOP_DEPTH = 0

    attr_reader :symbol, :threshold, :type

    def initialize symbol, threshold 
        @threshold = threshold
        @symbol = symbol
        @type = :ai
    end

    def make_move board
        update_depth_limit(board)
        if use_mini_max? then best_options = mini_max_top(board, @symbol)
        else best_options = make_random_move(board) end
        choice = best_options.sample
        choice
    end

    def mini_max_top board, player
        best_moves = []
        best_score = -1.0/0
        open_moves = board.get_open_spots
        open_moves.each do |move|
            board.record_choice(move,player)
            score = -mini_max(board, opponent(player), TOP_DEPTH+1, MIN_ALPHA, MAX_BETA)
            board.remove_choice(move)
            if score > best_score
                best_score = score
                best_moves.clear << move
            elsif score == best_score
                best_moves << move
            end
        end
        best_moves
    end

    def mini_max board, player, depth, alpha, beta
        if depth >= @depth_limit || alpha >= beta then return 0 end

        if board.check_board_status == :tie 
            return 0
        elsif board.check_board_status != :continue_game 
            return -(@depth_limit/depth)
        end

        open_moves = board.get_open_spots
        open_moves.each do |move|
            board.record_choice(move,player)
            score = -mini_max(board, opponent(player), depth+1, -beta,-alpha)
            board.remove_choice(move)
            alpha = score if score > alpha
        end
        alpha
    end

    def update_depth_limit board
        if board.get_open_spots.size > 18 then @depth_limit = 4
        elsif board.get_open_spots.size > 14 then @depth_limit = 5 
        elsif board.get_open_spots.size > 8 then @depth_limit = 6
        else @depth_limit = 7 end
    end

    def make_random_move board
        board.get_open_spots
    end

    def use_mini_max?
        if rand(100) < @threshold then true else false end
    end

    def opponent player
        if player == "O" then return "X" else return "O" end
    end
end

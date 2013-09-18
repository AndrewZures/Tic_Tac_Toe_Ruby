class HumanPlayer

    attr_reader :symbol, :opponent, :type

    def initialize(symbol, opponent, name)
      @symbol = symbol
      @opponent = opponent
      @type = :human
      @name = name
    end

    def make_move board
       -1
    end

end

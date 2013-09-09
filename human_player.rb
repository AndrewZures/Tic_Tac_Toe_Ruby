class HumanPlayer

    attr_reader :symbol, :type

    def initialize symbol
        @symbol = symbol
        @type = :human
    end

    def make_move board
       -1
    end

end

require_relative "./board.rb"

class Minesweep
    def initialize
        @grid = Board.new
    end



    def game
    #run game until you hit a bomb or you clear the board
    end

    def win?
    #does the board have any ""? if no then WIN!
    end

    def get_input
        pos = nil
        until @grid.legal_pos?(pos)
            puts "please Enter a position - ex. '3,4' "
            pos = parse_pos(gets.chomp)
        end
        pos
    end

    def parse_pos(string)
    string.split(",").map { |char| Integer(char) }
    end

end
class Board

    def initialize
        new_arr = Array.new(9) {Array.new(9,"")}
        8.times { new_arr[rand(0..8)][rand(0..8)] = "B"}
        @rows = new_arr
    end

    def [](pos)
        row,col = pos
        @rows[row][col]
    end

    def []=(pos,value)
        row,col = pos
        @rows[row][col] = value
    end

    def columns
            @rows.transpose
    end

    def diagnol
        #diagnol of a pos
    end
    
    def reveal_neighbors(pos)
            #show who surrounding neighbors are
    
    end
    
    def show_row(pos)
            #shows left and right of pos if they are NOT bombs or not flagged
    end

    def show_col
        #shows up and down of pos if they are NOT bombs or not flagged
    end
    require "byebug"
    def show_diagnol(pos)
        # debugger
        row,col = pos
        up_right = [(row - 1),(col -1)]
        up_left = [(row -1),(col + 1)]
        low_right = [(row + 1),(col + 1)]
        low_left = [(row + 1),(col - 1)]

        diagnols = up_right,up_left,low_right,low_left
        diagnols.each do |diagnol|
            if no_flag_or_bomb?(diagnol) && legal_pos?(diagnol)
                d_row,d_col = diagnol
                @rows[d_row][d_col] = "X"
            end
        end
                

    end

    def legal_pos?(pos)
        row,col = pos
        if (row < 0 || row > 8) && (col < 0 || col > 8)
            return false
        end

        true
    end

    def no_flag_or_bomb?(pos)
        row,col = pos
        if @rows[row][col] == "F" || @rows[row][col] == "B"
            return false
        end
        true
    end

   

end
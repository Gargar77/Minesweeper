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

    def flag(pos)
        row, col = pos
        if @rows[row][col] == "B"
            @rows[row][col] = "FB"
            return true
        else
            @rows[row][col] = "F"
            return true
        end
        return false
    end
    
    def reveal_neighbors(pos)
        row,col = pos
       if no_flag_or_bomb?(pos) && legal_pos?(pos)
        @rows[row][col] = fringe_count(pos)
        show_row(pos)
        show_col(pos)
        show_diagnol(pos)
        return true
       end
       false
    end
    
    def show_row(pos)
        row,col = pos
        left_row = [row,(col - 1)] 
        right_row = [row,(col + 1)]

        sides = left_row,right_row
        sides.each do |side|
            if no_flag_or_bomb?(side) && legal_pos?(side)
                s_row,s_col = side
                @rows[s_row][s_col] = fringe_count(side)
            end
        end
    end

    def show_col(pos)
        row,col = pos
        up = [(row - 1),col]
        down = [(row + 1),col]

        up_down = up,down
        up_down.each do |c|
            if no_flag_or_bomb?(c) && legal_pos?(c)
                c_row,c_col = c
                @rows[c_row][c_col] = fringe_count(c)
            end
        end
    end
    require "byebug"
    def show_diagnol(pos)
        row,col = pos
        up_right = [(row - 1),(col -1)]
        up_left = [(row -1),(col + 1)]
        low_right = [(row + 1),(col + 1)]
        low_left = [(row + 1),(col - 1)]

        diagnols = up_right,up_left,low_right,low_left
        diagnols.each do |diagnol|
            if no_flag_or_bomb?(diagnol) && legal_pos?(diagnol)
                d_row,d_col = diagnol
                @rows[d_row][d_col] = fringe_count(diagnol)
            end
        end
                

    end

    def legal_pos?(pos)
        row,col = pos
        if (row < 0 || row > 8) || (col < 0 || col > 8)
            return false
        end

        true
    end

    def no_flag_or_bomb?(pos)
        row,col = pos
        if @rows[row][col] == "F" || @rows[row][col] == "B" || @rows[row][col] == "FB"
            return false
        end
        true
    end

    def fringe_count(pos)
        adjacent = adjacent_pos(pos)
        count = 0
        adjacent.each do |adj|
            row,col = adj
            if (@rows[row][col] == "B" || @rows[row][col] == "FB")  && legal_pos?(adj)
                count += 1
            end
        end

        return count
    end

    def adjacent_pos(pos)
        row,col = pos
        up_right = [(row - 1),(col -1)]
        up_left = [(row -1),(col + 1)]
        low_right = [(row + 1),(col + 1)]
        low_left = [(row + 1),(col - 1)]
        up = [(row - 1),col]
        down = [(row + 1),col]
        left_row = [row,(col - 1)] 
        right_row = [row,(col + 1)]

        adjacent = [up_right,up_left,low_right,low_left,up,down,left_row,right_row]

        return adjacent
    end

   

end
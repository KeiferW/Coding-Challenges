class Board
    
    def self.get_bombs(row,col,inp)
        surrounding_tiles=[]
        count = 0
        #loop to find the tiles surrounding one tile
        for r in row-1..row+1
            for c in col-1..col+1
            surrounding_tiles.push(inp[r][c])
            end
        end
        #check for any * in the surrounding tiles
        for tile in surrounding_tiles
            if tile == '*'
                count=count+1
            end
        end
        return count.to_s
    end
    def self.transform(inp)
        #check for faulty border
        row_len = inp.length-1
        col_len = inp[0].length-1
        for r in 1..row_len-1
            if inp[r][0] != "|" && inp[r][col_len] != "|"
                raise ArgumentError
            end
        end
        #check for faulty border
        for c in 0..col_len
            if inp[0][c] != "+" && inp[0][c] !="-"
                raise ArgumentError
            end
            if inp[row_len][c] != "+" && inp[row_len][c] !="-"
                raise ArgumentError
            end
        end
        #check that all rows are the same length 
        for r in 0..row_len
            if inp[r].length != inp[0].length
                raise ArgumentError
            end
        end
        for r in 0..row_len
            for c in 0..col_len
                #check for any invalid characters  in input
                if inp[r][c] != "+" && inp[r][c] != "-" && inp[r][c] != "|" && inp[r][c] != "*" && inp[r][c] != " "
                    raise ArgumentError
                end
                #if blank space count bombs around 
                if inp[r][c] == " "
                    inp[r][c]=get_bombs(r,c,inp)
                    #if 0 bombs turn back to black space
                    if inp[r][c]=="0"
                        inp[r][c]=" "
                    end
                end
            end
        end 
        return inp
    end
end

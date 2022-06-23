require "byebug"
class Board
  
    def self.print_grid(grid)

        grid.each do |row|
            puts row.join(" ")
        end
        
    end

    def initialize(n)
    
        @grid = Array.new(n){Array.new(n, :N)}
        @size = n*n 
    
    end

    def size
        @size
    end

    def [](pos)
        row, col = pos
        @grid[row][col]
    
    end

    def []=(pos,value)
        row, col = pos
        @grid[row][col] = value
        
    end

    def num_ships
        count = 0
        @grid.flatten.each do |i|
            if i == :S
                count += 1
            end
        end
        count
    end


    #PART 2

    def attack(pos)
        if self[pos] == :S
            self[pos] = :H
            #@grid[pos[0]][pos[1]] == :S
            #@grid[pos[0]][pos[1]] = :H
            puts 'you sunk my battleship!'
            return true
        else #self[pos] != :S
            self[pos]= :X
            return false
        end
    
    end

    def place_random_ships
    
        total = @size * 0.25
        while self.num_ships < total
            row = rand(0...@grid.length)
            col = rand(0...@grid.length)
            pos = [row,col]
            self[pos] = :S 
        end
    
    end

    def hidden_ships_grid
    
        @grid.map do |row|
            row.map do |i| 
                if i == :S
                    :N
                else
                    i   
                end 
            end
        end
            
        
    end



    def cheat
    
        Board.print_grid(@grid)
    
    end

    def print
    
    Board.print_grid(hidden_ships_grid)
    
    
    end






end

require_relative "board"
require_relative "player"
require "byebug"

class Battleship
    
#PART 3
    attr_reader :board , :player 
    def initialize(n=0)
    
        @player = Player.new
        @board = Board.new(n)
        @remaining_misses = @board.size * 0.5
    
    end

    def start_game
    
        @board.place_random_ships
        puts @board.num_ships
         @board.print
    
    end

    def lose?
        if @remaining_misses < 1
            puts 'you lose'
            return true
        else
            return false
        end
    end
    
    def win?
        ships = @board.num_ships
        if ships == 0
            puts 'you win'
            return true
        else
            return false
        end
    end

    def game_over?
    
        if self.win? == true || self.lose? == true
            return true
        else
            return false
        end
    
    end

    def turn
    
        move = @player.get_move
        
         @board.print
        attack = @board.attack(move)
        if attack == false
            @remaining_misses -= 1
            puts @remaining_misses
        else
            puts @remaining_misses
        end
    
    
    
    end


end

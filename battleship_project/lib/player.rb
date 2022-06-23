class Player

    #PART 3

    def get_move
        puts 'enter a position with coordinates separated with a space like `4 7`'
        
        input = gets.chomp.split(" ")
        input.map!{|i| i = i.to_i}
        input
    end

end

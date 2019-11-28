
module Players
  
  class Human < Player
  
    def move(board)
      puts "Select a space from 1 to 9"
      input = gets.strip
    end
  
  end

end
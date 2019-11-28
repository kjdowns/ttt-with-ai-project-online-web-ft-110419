
module Players
  
  class Computer < Player
    
    def move(board)
      input = rand(1..9).to_s
      if !board.taken?(input)
        input
      else
        self.move(board)
      end
    end
    
  end
  
end
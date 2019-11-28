require 'pry'
class Game
  
  attr_accessor :board, :player_1, :player_2
  
  WIN_COMBINATIONS = [
    [0, 1, 2], # top row
    [3, 4, 5], # middle row
    [6, 7, 8], # bottom row 
    [0, 3, 6], # left collumn
    [1, 4, 7], # middle collumn
    [2, 5, 8], # right collumn
    [0, 4, 8], # diagonal top to bottom
    [6, 4, 2] # diagonal bottom to top 
  ]
  
  def initialize(player_1=Players::Human.new("X"), 
                 player_2=Players::Human.new("O"), 
                 board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end
  
  def current_player
    turn_count = self.board.cells.select{|cell| cell != " "}
    turn_count.length.even? ? player_1 : player_2
  end
  
  def won?
    win = nil
	  WIN_COMBINATIONS.each do |combo_array|
		  win_check_array = []
		  combo_array.each do |index|
			  win_check_array << self.board.cells[index]
		  end
		  if win_check_array.all? {|a| a == "X"}
        win = combo_array
      elsif win_check_array.all? {|a| a == "O"}
        win = combo_array
      else
        win
      end
	  end
    win
	end
  
  def draw?
    self.board.full? && !self.won?
  end
  
  def over?
    self.won? || self.draw?
  end
  
  def winner
    if self.won?
      self.board.cells[self.won?[0]]
    end
  end
  
  def turn
    input = self.current_player.move(self.board)
    while !self.board.valid_move?(input)
      input = self.current_player.move(self.board)
    end
    self.board.update(input, self.current_player)
  end
  
  def play
    while !self.over?
      self.turn
      self.board.display
      puts ""
    end
    if self.won?
      puts "Congratulations #{self.winner}!"
    elsif self.draw?
      puts "Cat's Game!"
    end
  end
  
  def start
    self.play
  end
  
end
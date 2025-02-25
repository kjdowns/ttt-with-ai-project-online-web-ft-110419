
class Board 
  
  attr_accessor :cells
  
  def initialize
    self.reset!
  end
  
  def display
    puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts "-----------"
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts "-----------"
    puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
  end
  
  def position(user_input)
    self.cells[user_input.to_i - 1]
  end
  
  def full?
    self.cells.all?{|cell| cell != " "}
  end
  
  def turn_count
    self.cells.count{|cell| cell != " "}
  end
  
  def taken?(user_input)
    self.position(user_input) != " "
  end
  
  def valid_move?(user_input)
    !self.taken?(user_input) && user_input.to_i.between?(1,9)
  end
  
  def update(user_input, player)
    self.cells[user_input.to_i - 1] = player.token
  end
  
  def reset!
    self.cells = Array.new(9," ")
  end
  
end
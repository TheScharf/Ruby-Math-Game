class Player
  attr_accessor :name, :lives, :input
  def initialize(name)
    @name = name
    @lives =  3
    @input = nil
  end

  def lose()
    self.lives -= 1
  end

  def player_input()
    self.input = gets.chomp
  end

end
class Turn
  attr_accessor :turnNum, :player, :question

  def initialize(turnNum, player, question)
    @turnNum = turnNum
    @player = player
    @question = question
  end

  def questAsked()
    puts "#{self.player.name}: #{self.question.question}"
    input = self.player.player_input()

    if input.to_i != self.question.answer()
      self.player.lose()
      puts "#{self.player.name}: Seriously? No!"
    else
      puts "#{self.player.name}: Yes! You are correct!"
    end
  end
end
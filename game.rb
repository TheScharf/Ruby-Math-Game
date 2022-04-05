require './player'
require './questions'

class Game
  attr_accessor :turnNum, :turn, :gameOver, :player1, :player2

  def initialize()
    @player1 = Player.new('Player 1')
    @player2 = Player.new('Player 2')
    @turnNum = 1
    @turn = Turn.new(@turnNum, @player1, Questions.new(rand(1..20), rand(1..20)))
    @gameOver = false
  end

  def nextTurn()
    self.turnNum += 1

    if self.turn.player == self.player1
      self.turn = Turn.new(turnNum, self.player2, Questions.new(rand(1..20), rand(1..20)))
    else
      self.turn = Turn.new(turnNum, self.player1, Questions.new(rand(1..20), rand(1..20)))
    end

  end

  def score()
    if self.player1.lives <= 0
      self.gameOver = true
    end
    if self.player2.lives <= 0
      self.gameOver = true
    end
    puts "p1: #{self.player1.lives}/3 vs p2: #{self.player2.lives}/3"
  end

  def wins()
    if self.player1.lives > self.player2.lives
      puts "#{self.player1.name} wins with a score of #{self.player1.lives}/3"
    else
      puts "#{self.player2.name} wins with a score of #{self.player2.lives}/3"
    end
  end
end

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
require './game'



match = Game.new()

while !match.gameOver
  match.turn.questAsked()
  match.score()
  match.nextTurn()
  puts "----- NEW TURN -----"
end

match.wins()
puts "----- GAME OVER -----"
puts "Good bye!"
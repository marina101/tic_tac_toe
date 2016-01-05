class Game

  require_relative 'board'
  require_relative 'player'
  finished = false
  
  board = Board.new
  player1 = Player.new(1)
  player2 = Player.new(2)

  puts "Welcome to tic-tac-toe!"

  while (!finished) do 
    board.clearBoard
    board.showBoard

    even = true  #to alternate between player one and player two
    won = false 
    #The main game loop - runs 9 times because after that it is a tie if nobody has won
    9.times do
      if !even
        even = true
      else
        even = false
      end

      player = player1 if !even
      player = player2 if even

      ask = true
      while(ask)
        row = player.askInputRow
        col = player.askInputColumn
        ask = board.add(player.marker, row.to_i, col.to_i)
      end

      board.showBoard


      if board.win?(player.marker)
        won = true
        break
      else
        won = false
      end
    end
    
    puts "It's a tie!" if !won
    puts "Do you want to play again? Type 'y' if yes, any other key to quit"
    play_again = gets.chomp
    finished = true unless play_again.downcase == 'y'
  end

  puts "Thanks for playing!"

end
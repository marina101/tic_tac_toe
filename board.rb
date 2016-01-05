class Board
  attr_accessor :board

  def initialize
    @board = [['-', '-', '-'], ['-', '-', '-'], ['-', '-', '-']]
  end

  def clearBoard
    @board = [['-', '-', '-'], ['-', '-', '-'], ['-', '-', '-']]
  end

  def showBoard
    @board.each do |x|
      x.each do |y|
        print "[#{y}]"
      end
      puts "\n"
    end
  end


  def win?(token)
    win = false
    
    tokenCount = 0
    otherToken = 0

    #checks for horizonal row victories
    @board.each {|row| win = true if row.all? {|x| x == token}}  
    if win
      puts "Congratulations, player #{token}, you have won!"
      return win
    end

    #checks for vertical victories
    verticalArray = [[@board[0][0], @board[1][0], @board[2][0]], [@board[0][1], @board[1][1], @board[2][1]], [@board[0][2], @board[1][2], @board[2][2]]]
    verticalArray.each {|row| win = true if row.all? {|x| x == token}}
    if win
      puts "Congratulations, player #{token}, you have won!"
      return win
    end

    #checks for diagonal victories
    diagonalArray = [[@board[0][0], @board[1][1], @board[2][2]], [@board[2][0], @board[1][1], @board[0][2]]]
    diagonalArray.each {|row| win = true if row.all? {|x| x == token}}
    if win
      puts "Congratulations, player #{token}, you have won!"
      return win
    end

    return win
  end

  #returns true if marker was added to free spot, false if spot was occupied
  def add(marker, horizontal, vertical)
    if (@board[horizontal][vertical] != 'X' &&  @board[horizontal][vertical] != 'O')
      @board[horizontal][vertical] = marker    
      false
    else
      puts "That square is already taken, please try again"
      true
    end
  end

end
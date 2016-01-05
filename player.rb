class Player
  attr_accessor :marker

  def initialize(num)
    @marker = 'X' if num == 1
    @marker = 'O' if num == 2
  end

  def askInputRow
    puts "Player #{self.marker}, which row do you want to put your marker in? (0, 1, 2)"
    rowAnswer = gets.chomp
    rowAnswer
  end

  def askInputColumn
    puts "Player #{self.marker}, which column do you want to put your marker in? (0, 1, 2)"
    columnAnswer = gets.chomp
    columnAnswer
  end



end
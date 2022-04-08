class Board
  attr_reader :positions
  def initialize  
    @positions = Hash.new
    for i in 1..9
      @positions[i] = 0
    end
  end

end


class Game
  
  def initialize
    @board = Board.new
    @turn = 1
    @game_over = false
    @winning_player = "0"

    while (!@game_over && @turn < 10)
      
      print_game_board
      if(@turn%2 == 0)
        puts "It is X player turn!!"
      else
        puts "It is O player turn!!"
      end
      puts "Where would you like to place your pip?"
      @selected_position = gets
      if (@selected_position.to_i >0 && @selected_position.to_i <10 && @board.positions[@selected_position.to_i] == 0)
        if(@turn%2 == 0)
          @board.positions[@selected_position.to_i] = "X"
        else
          @board.positions[@selected_position.to_i] = "O"
        end
        @game_over = is_game_over
        @turn += 1
      end
    end

    puts "Game Over!!"
    print_game_board
    if(@winning_player == "0")
      puts "You got a TIE!!!"
    else
      puts "The winning player is #{@winning_player}"
    end

  end

  #Check if there is a game over situation
  def is_game_over
    if (all_equal(@board.positions[1], @board.positions[2], @board.positions[3]))
      @winning_player = @board.positions[1]
      return true 
    elsif (all_equal(@board.positions[4], @board.positions[5], @board.positions[6]))
      @winning_player = @board.positions[4]
      return true
    elsif (all_equal(@board.positions[7], @board.positions[8], @board.positions[8]))
      @winning_player = @board.positions[7]
      return true
    elsif (all_equal(@board.positions[1], @board.positions[4], @board.positions[7]))
      @winning_player = @board.positions[1]
      return true
    elsif (all_equal(@board.positions[2], @board.positions[5], @board.positions[8]))
      @winning_player = @board.positions[2]
      return true
    elsif (all_equal(@board.positions[3], @board.positions[6], @board.positions[9]))
      @winning_player = @board.positions[3]
      return true
    elsif (all_equal(@board.positions[1], @board.positions[5], @board.positions[9]))
      return true
    elsif (all_equal(@board.positions[3], @board.positions[5], @board.positions[7]))
      @winning_player = @board.positions[1]
      return true
    end
    return false
  end

  #Check if three positons are equal to eachother
  def all_equal(pos1, pos2, pos3)
    if(pos1 == 0 || pos2 == 0 || pos3 == 0)
      return false
    end
    if(pos1 == pos2 && pos2 == pos3)
      return true
    end
    return false
  end

  #Print the game board
  def print_game_board
    puts "#{@board.positions[1]} | #{@board.positions[2]} | #{@board.positions[3]}"
    puts "---------"
    puts "#{@board.positions[4]} | #{@board.positions[5]} | #{@board.positions[6]}"
    puts "---------"
    puts "#{@board.positions[7]} | #{@board.positions[8]} | #{@board.positions[9]}"
  end

  
end

game = Game.new


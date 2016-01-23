# OO TIC TAC TOE

# Description:

#   Tic Tac Toe is 2-player board game played on a 3x3 grid, Players take turns marking
#   a square. The first player to mark 3 squares in a row wins.

# Nouns and Verbs:

#   Nouns: board, player, square, grid.
#   Verbs: play, mark.

# Organizing Nouns and Verbs:

#   Board
#   Square
#   Player
#   - mark
#   - play

# Spike

class Board
  def initialize
    # we need some way to model the 3x3 grid. maybe "squares"?
    # what data structure should we use?
    # - array/hash of Square objects?
    # - array/hash of strings or integers?
  end
end

class Square
  def initialize
    # maybe a "status" to keep track of this square's mark?
  end
end

class Player
  def initialize
    # maybe a "marker" to keep track of this player's symbol (ie, 'X' or 'O')
  end
  
  def mark
  
  end
  
  def play
  
  end
end

class TTTGame
  def play
    display_welcome_message
    loop do
      display_board
      first_player_moves
      break if someone_won? || board_full?
      
      second_player_moves
      break if someone_won? || board_full?
    end
    display_result
    display_goodbye_message
  end
end

#we'll kick off the game like this
game = TTTGame.new
game.play

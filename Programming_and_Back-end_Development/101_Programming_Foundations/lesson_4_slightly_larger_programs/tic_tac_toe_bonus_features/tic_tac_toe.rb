require 'pry'

INITIAL_MARKER = " "
PLAYER_MARKER = "X"
COMPUTER_MARKER = "O"
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]] # diagonals
PICK_ORDER = "choose" # "choose" for picking order. "" (empty) Player will go always first
WIN_POINTS = 10
LOSE_POINTS = 10
TIE_POINTS = 0

def prompt(msg)
  puts "=> #{msg}"
end

# Start Bonus features methods
def joinor(array, delim = ', ', last_delim = 'or')
  if array.length > 1
    array[0, array.length - 1].join(delim) + "#{delim}#{last_delim} #{array.last}"
  else
    array.join
  end
end

def display_score(score1, score2)
  prompt("Score: ")
  prompt("Player: #{score1}; Computer: #{score2}.")
end

def detect_1_missing(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(COMPUTER_MARKER) == 2
      line.each { |val| return val if brd[val] == " " }
    elsif brd.values_at(*line).count(PLAYER_MARKER) == 2
      line.each { |val| return val if brd[val] == " " }
    elsif brd[5] == " "
      return 5
    end
  end
  # if none of the cases happen, just select a random location in the board
  empty_squares(brd).sample
end

def place_piece!(brd, player)
  if player == 'p'
    player_places_piece!(brd)
  elsif player == 'c'
    computer_places_piece!(brd)
  end
end

def alternate_player(player)
  if player == 'p'
    player = 'c'
  elsif player == 'c'
    player = 'p'
  end
  player
end

# Start Minimax Section
def generate_options_tree(brd, player = true)
  possible_outcomes = []
  empty_squares(brd).each do |val|
    brd_safe = brd.clone
    brd_safe[val] = COMPUTER_MARKER if player
    brd_safe[val] = PLAYER_MARKER if !player
    possible_outcomes << [brd_safe, val, 0]
  end
  puts possible_outcomes.to_s
  player = !player
  possible_outcomes
end
# End Minimax Section

# End Bonus features methods

# rubocop:disable Metrics/AbcSize
def display_board(brd = initialize_board)
  system 'clear'
  puts "You're a '#{PLAYER_MARKER}'. Computer is '#{COMPUTER_MARKER}'"
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1...10).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  square = ''
  loop do
    # prompt("Choose a square (#{empty_squares(brd).join(', ')}):")
    prompt("Choose a square (#{joinor(empty_squares(brd), '; ', 'and')}):")
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt("Sorry, that's not a valid choice.")
  end
  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  # square = empty_squares(brd).sample # random selection
  square = detect_1_missing(brd)
  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    # if brd[line[0]] == PLAYER_MARKER &&
    #   brd[line[1]] == PLAYER_MARKER &&
    #   brd[line[2]] == PLAYER_MARKER
    #   return "Player"
    # elsif brd[line[0]] == COMPUTER_MARKER &&
    #       brd[line[1]] == COMPUTER_MARKER &&
    #       brd[line[2]] == COMPUTER_MARKER
    #   return "Computer"
    # end
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return "Player"
    elsif brd.values_at(line[0], line[1], line[2]).count(COMPUTER_MARKER) == 3
      return "Computer"
    end
  end
  nil
end

player_score = 0
computer_score = 0
player = ''

prompt("Who goes first? (Type p for Player, c for Computer)")

if PICK_ORDER == "choose"
  loop do
    player = gets.chomp
    break if %w(c p).include?(player)
    prompt("Not a valid value. Please pick p or c")
  end
else
  player = 'p'
end

display_score(player_score, computer_score)

loop do
  board = initialize_board

  loop do
    display_board(board)
    place_piece!(board, player)
    player = alternate_player(player)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board)

  if someone_won?(board)
    prompt("#{detect_winner(board)} won!")
    player_score += 1 if detect_winner(board) == "Player"
    computer_score += 1 if detect_winner(board) == "Computer"
  else
    prompt("It's a tie!")
  end

  display_score(player_score, computer_score)
  prompt("Play again? (y or n)")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thanks for playing Tic Tac Toe! Good Bye!")

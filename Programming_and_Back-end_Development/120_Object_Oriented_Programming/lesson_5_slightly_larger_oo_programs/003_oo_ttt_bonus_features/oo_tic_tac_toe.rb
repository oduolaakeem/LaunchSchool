require 'pry'

class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                  [[1, 5, 9], [3, 5, 7]] # diagonals

  def initialize
    @squares = {} # {1 => Square.new(' '), 2 => Square.new(' ')}
    reset
  end

  # rubocop:disable Metrics/AbcSize
  def draw
    puts "     |     |"
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}"
    puts "     |     |"
    puts ""
  end
  # rubocop:enable Metrics/AbcSize

  def []=(key, marker)
    @squares[key].marker = marker
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  # returns winning marker or nil
  def winning_marker
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if three_identical_markers?(squares)
        return squares.first.marker
      end
    end
    nil
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end

  def human_one_missing(human_marker)
    WINNING_LINES.each do |line|
      if @squares.values_at(*line).collect(&:marker).count(human_marker) == 2
        line.each { |key| return key if @squares[key].marker == Square::INITIAL_MARKER }
      end
    end
    nil
  end

  def computer_one_missing(computer_marker)
    WINNING_LINES.each do |line|
      if @squares.values_at(*line).collect(&:marker).count(computer_marker) == 2
        line.each { |key| return key if @squares[key].marker == Square::INITIAL_MARKER }
      end
    end
    nil
  end

  private

  def three_identical_markers?(squares)
    markers = squares.select(&:marked?).collect(&:marker)
    return false if markers.size != 3
    markers.min == markers.max
  end
end

class Square
  INITIAL_MARKER = " "
  attr_accessor :marker

  def initialize(marker = INITIAL_MARKER)
    @marker = marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end

  def marked?
    marker != INITIAL_MARKER
  end

  def to_s
    @marker
  end
end

class Player
  attr_reader :marker
  attr_accessor :score, :name
  def initialize(name, marker)
    @name = name
    @marker = marker
    reset_score
  end

  def reset_score
    @score = 0
  end
end

class TTTGame
  HUMAN_MARKER = "X"
  COMPUTER_MARKER = "O"
  FIRST_TO_MOVE = HUMAN_MARKER
  SCORE_TO_WIN = 5
  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new
  end

  # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
  def play
    display_welcome_message
    setup_players
    loop do
      loop do
        display_board
        display_scores
        loop do
          current_player_moves
          break if board.someone_won? || board.full?
          clear_screen_and_display_board
        end
        display_result_and_update_score
        display_scores
        break if game_reached_max_score?
        pause_until_enter_pressed
        reset_round
      end
      display_game_winner
      break unless play_again?
      reset_game
      display_play_again_message
    end
    display_goodbye_message
  end
  # rubocop:enable Metrics/AbcSize, Metrics/MethodLength

  private

  def setup_players
    setup_human_player
    setup_computer_player
    @current_marker = human.marker
  end

  def setup_human_player
    player_name = nil
    player_marker = nil
    loop do
      puts "Enter your name: "
      player_name = gets.chomp
      break unless player_name.empty?
      puts "Not a valid name!"
    end
    loop do
      puts "Enter your marker: (ex: 'X', 'O')"
      player_marker = gets.chomp
      break unless player_marker.empty? || player_marker.size > 1
      puts "Not a valid marker!"
    end
    @human = Player.new(player_name, player_marker)
  end

  # rubocop: disable Metrics/AbcSize
  def setup_computer_player
    player_name = nil
    player_marker = nil
    loop do
      puts "Enter computer name: "
      player_name = gets.chomp
      break unless player_name.empty?
      puts "Not a valid name!"
    end
    loop do
      puts "Enter computer marker: (ex: 'X', 'O')"
      player_marker = gets.chomp
      break unless player_marker.empty? || player_marker.size > 1 || player_marker == human.marker
      puts "Not a valid marker!"
    end
    @computer = Player.new(player_name, player_marker)
  end
  # rubocop: enable Metrics/AbcSize

  def display_welcome_message
    puts "Welcome to Tic Tac Toe!"
    puts ""
  end

  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe! Goodbye!"
  end

  def display_board
    puts "You're a #{human.marker}. Computer is a #{computer.marker}"
    puts ""
    board.draw
  end

  def clear_screen_and_display_board
    system 'clear'
    display_board
  end

  def current_player_moves
    if @current_marker == human.marker
      human_moves
      @current_marker = computer.marker
    elsif @current_marker == computer.marker
      computer_moves
      @current_marker = human.marker
    end
  end

  def pause_until_enter_pressed
    puts "Press ENTER to continue"
    gets
  end

  def display_game_winner
    if human.score == SCORE_TO_WIN
      puts "You won the game!"
    elsif computer.score == SCORE_TO_WIN
      puts "Computer won the game!"
    end
  end

  def prompt_for_human_selection
    array = board.unmarked_keys
    if array.length > 1
      puts "Choose a square " + array[0, array.length - 1].join(', ') + ", or #{array.last}"
    else
      puts "Choose a square #{array.join}"
    end
  end

  def human_moves
    prompt_for_human_selection
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry, that's not a valid choice."
    end
    board[square] = human.marker
  end

  # rubocop: disable Metrics/AbcSize
  def computer_moves
    if board.computer_one_missing(computer.marker)
      board[board.computer_one_missing(computer.marker)] = computer.marker
    elsif board.human_one_missing(human.marker)
      board[board.human_one_missing(human.marker)] = computer.marker
    else
      board[board.unmarked_keys.sample] = computer.marker
    end
  end
  # rubocop: enable Metrics/AbcSize

  def display_scores
    puts "Score: You (#{human.score}); Computer (#{computer.score})"
  end

  def display_result_and_update_score
    clear_screen_and_display_board
    case board.winning_marker
    when human.marker
      puts "You won the round!"
      human.score += 1
    when computer.marker
      puts "Computer Won the round!"
      computer.score += 1
    else
      puts "It's a tie!"
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y n).include? answer
      puts "Sorry, must be y or n"
    end

    answer == 'y'
  end

  def game_reached_max_score?
    human.score == SCORE_TO_WIN || computer.score == SCORE_TO_WIN
  end

  def clear
    system 'clear'
  end

  def reset_round
    board.reset
    clear
    @current_marker = human.marker
  end

  def reset_game
    reset_round
    human.reset_score
    computer.reset_score
  end

  def display_play_again_message
    puts "Let's play again!"
    puts ""
  end
end

game = TTTGame.new
game.play

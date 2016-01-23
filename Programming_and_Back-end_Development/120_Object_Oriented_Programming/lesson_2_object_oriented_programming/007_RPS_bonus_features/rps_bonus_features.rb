require 'pry'

class WeightedArray
  attr_accessor :array, :weights, :ranges

  def initialize(array, weights_array = nil)
    self.array = array
    !weights_array ? set_weights : self.weights = weights_array
    set_ranges
  end

  def random_item
    random_value = Random.new.rand(ranges.last.last.to_f)
    random_selection = nil
    ranges.each_with_index do |range, index|
      if range[0] < random_value && random_value <= range[1]
        random_selection = array[index]
      end
    end
    random_selection
  end

  def increase_weight(index, units_increased)
    weights[index] += units_increased
    set_ranges
  end

  def decrease_weight(index, units_decreased)
    weights[index] - units_decreased <= 0 ? weights[index] = 0 : weights[index] -= units_decreased
    set_ranges
  end

  def set_weights
    self.weights = []
    array.size.times { weights << 100 }
  end

  def set_ranges
    self.ranges = []
    acum = 0
    weights.each do |weight|
      min = acum
      acum += weight
      max = acum
      ranges << [min, max]
    end
  end

  def to_s
    array.each_with_index do |value, index|
      puts "'#{value}' pick up chance #{(weights[index] / ranges.last.last.to_f * 100).round(2)}"
    end
  end
end

class Rock
  NAME = 'rock'
  attr_accessor :name, :win_against, :lose_against

  def initialize
    self.win_against = 'scissors'
    self.lose_against = 'paper'
    self.name = NAME
  end
end

class Paper
  NAME = 'paper'
  attr_accessor :name, :win_against, :lose_against

  def initialize
    self.win_against = 'rock'
    self.lose_against = 'scissors'
    self.name = NAME
  end
end

class Scissors
  NAME = 'scissors'
  attr_accessor :name, :win_against, :lose_against

  def initialize
    self.win_against = 'paper'
    self.lose_against = 'rock'
    self.name = NAME
  end
end

class Move
  VALUES = %w(rock paper scissors)
  attr_accessor :value

  def initialize(value)
    self.value = select_rps(value)
  end

  def select_rps(value)
    obj = nil
    if value == 'rock'
      obj = Rock.new
    elsif value == 'paper'
      obj = Paper.new
    elsif value == 'scissors'
      obj = Scissors.new
    end
    obj
  end

  def >(other_move)
    value.win_against.include?(other_move.value.name)
  end

  def <(other_move)
    value.lose_against.include?(other_move.value.name)
  end

  def to_s
    @value.name
  end
end

class Player
  @@move_history = {}
  attr_accessor :move, :name, :score

  def initialize
    set_name
    reset_score
    @@move_history[name] = []
  end

  def reset_score
    self.score = 0
  end

  def add_move(round_result)
    @@move_history[name] << [move.to_s, round_result]
  end

  def self.display_players_history
    @@move_history.each do |player, results|
      puts "#{player} last 5 moves: "
      puts "#{results.reverse[0, 5]}"
    end
  end

  def self.move_history
    @@move_history
  end
end

class Human < Player
  def set_name
    n = ""
    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, must enter a value."
    end
    self.name = n
  end

  def choose
    choice = ''
    loop do
      puts "Please choose rock, paper, or scissors:"
      choice = gets.chomp
      break if Move::VALUES.include?(choice)
      puts "Sorry, invalid choice."
    end
    self.move = Move.new(choice)
  end
end

class Computer < Player
  ROCK_INDEX = 0
  PAPER_INDEX = 1
  SCISSORS_INDEX = 2

  attr_accessor :choices

  def initialize
    super()
  end

  def set_name
    self.name = %w(R2D2 Hal Chappie Sonny Number5).sample
    set_personality
  end

  def set_personality
    case name
    when 'RSD2'
      self.choices = WeightedArray.new(Move::VALUES, [100, 0, 0])
    when 'Hal'
      self.choices = WeightedArray.new(Move::VALUES, [20, 0, 80])
    when 'Sonny'
      self.choices = WeightedArray.new(Move::VALUES, [10, 80, 10])
    when "Chappie"
      self.choices = WeightedArray.new(Move::VALUES, [100, 100, 100])
    when 'Number5'
      self.choices = WeightedArray.new(Move::VALUES, [50, 0, 50])
    end
  end

  def choose
    # self.move = Move.new(Move::VALUES.sample)
    self.move = Move.new(choices.random_item)
    check_history
  end

  def check_history
    # statistics = {rock: {win: 0, loss: 0, tie: 0}, paper: {win: 0, loss: 0, tie: 0}, scissors: {win: 0, loss: 0, tie: 0}}
    statistics = {}
    statistics[:rock] = check_rock_history
    statistics[:paper] = check_paper_history
    statistics[:scissors] = check_scissors_history
    self.choices.decrease_weight(ROCK_INDEX, 1) if statistics[:rock][:loss] > 0.4
    self.choices.decrease_weight(PAPER_INDEX, 1) if statistics[:paper][:loss] > 0.4
    self.choices.decrease_weight(SCISSORS_INDEX, 1) if statistics[:scissors][:loss] > 0.4
  end

  def check_rock_history
    rock_wins = Player.move_history[name].count { |round| round == ['rock', 'won'] }
    rock_lose = Player.move_history[name].count { |round| round == ['rock', 'lost'] }
    rock_tie = Player.move_history[name].count { |round| round == ['rock', 'tie'] }
    rock_total = rock_wins.to_f + rock_lose.to_f + rock_tie.to_f
    { win: rock_wins / rock_total, loss: rock_lose / rock_total, tie: rock_tie / rock_total }
  end

  def check_paper_history
    paper_wins = Player.move_history[name].count { |round| round == ['paper', 'won'] }
    paper_lose = Player.move_history[name].count { |round| round == ['paper', 'lost'] }
    paper_tie = Player.move_history[name].count { |round| round == ['paper', 'tie'] }
    paper_total = paper_wins.to_f + paper_lose.to_f + paper_tie.to_f
    { win: paper_wins / paper_total, loss: paper_lose / paper_total, tie: paper_tie / paper_total }
  end

  def check_scissors_history
    scissors_wins = Player.move_history[name].count { |round| round == ['scissors', 'won'] }
    scissors_lose = Player.move_history[name].count { |round| round == ['scissors', 'lost'] }
    scissors_tie = Player.move_history[name].count { |round| round == ['scissors', 'tie'] }
    scissors_total = scissors_wins.to_f + scissors_lose.to_f + scissors_tie.to_f
    { win: scissors_wins / scissors_total, loss: scissors_lose / scissors_total, tie: scissors_tie / scissors_total }
  end

  def display_computer_pick_chances
    puts "---------Computer Pick Up Chances---------"
    choices.to_s
    puts "------------------------------------------"
  end
end

# Game Orchestration Engine

class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors!"
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors. Good bye!"
  end

  def reset_score
    human.reset_score
    computer.reset_score
  end

  def display_moves
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}"
  end

  def display_winner
    if human.move > computer.move
      puts "#{human.name} won the round!"
    elsif human.move < computer.move
      puts "#{computer.name} won the round!"
    else
      puts "It's a tie!"
    end
  end

  def update_score
    if human.move > computer.move
      human.score += 1
    elsif human.move < computer.move
      computer.score += 1
    end
  end

  def add_move_to_history
    if human.move > computer.move
      human.add_move('won')
      computer.add_move('lost')
    elsif human.move < computer.move
      human.add_move('lost')
      computer.add_move('won')
    else
      human.add_move('tie')
      computer.add_move('tie')
    end
  end

  def display_history
    puts "-----------Last 5 Moves History-----------"
    Player.display_players_history
    puts "------------------------------------------"
  end

  def display_score
    puts "------------------Score!------------------"
    puts "#{human.name}(#{human.score})     #{computer.name}(#{computer.score})".center(44)
    puts "------------------------------------------"
  end

  def display_game_winner
    if human.score == 10
      puts "#{human.name} wins the game!"
    elsif computer.score == 10
      puts "#{computer.name} wins the game!"
    end
  end

  def game_ends?
    human.score == 10 || computer.score == 10
  end

  def play_again?
    answer = ""
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp
      break if %w(y n).include?(answer.downcase)
      puts "Sorry, must choose y or n."
    end

    return false if answer.downcase == 'n'
    return true if answer.downcase == 'y'
  end

  def play
    display_welcome_message
    loop do
      reset_score
      loop do
        display_score
        display_history
        computer.display_computer_pick_chances
        human.choose
        computer.choose
        display_moves
        display_winner
        update_score
        add_move_to_history
        break if game_ends?
      end
      display_score
      display_game_winner
      break unless play_again?
    end
    display_goodbye_message
  end
end

RPSGame.new.play

module Hand
  attr_accessor :cards

  def reset_cards
    @cards = []
  end

  def starting_cards(deck)
    2.times { @cards << deck.deal }
  end

  def hit(deck)
    @cards << deck.deal
  end

  def busted?
    total > 21
  end

  def got_21?
    total == 21
  end

  def total
    value = 0
    @cards.each do |card|
      if card.face.to_i.to_s == card.face
        value += card.face.to_i
      elsif card.face == 'Ace'
        value += 11
      else
        value += 10
      end
    end

    @cards.each { |card| value -= 10 if value > 21 && card.face == 'Ace' }
    value
  end

  # rubocop:disable Metrics/AbcSize
  def show_cards(options = { hide: false })
    cards_to_show = ""
    if options[:hide] == true
      @cards[0, @cards.size - 1].each do |card|
        cards_to_show << "#{card}, "
      end
      cards_to_show << "?? ??"
    elsif options[:hide] == false
      @cards[0, @cards.size - 1].each do |card|
        cards_to_show << "#{card}, "
      end
      cards_to_show << "#{@cards.last}"
      cards_to_show.insert(0, "(#{total}) ")
    end
    puts cards_to_show
  end
  # rubocop:enable Metrics/AbcSize
end

class Participant
  attr_accessor :score

  include Hand

  def initialize
    reset_cards
    reset_score
  end

  def reset_score
    @score = 0
  end
end

class Player < Participant
  attr_accessor :name

  def initialize(name)
    @name = name
    super()
  end
end

class Dealer < Participant
  attr_accessor :name

  def initialize(name)
    @name = name + " (Dealer)"
    super()
  end

  def stay?
    total >= Game::DEALER_DRAW_LIMIT
  end
end

class Deck
  attr_accessor :cards

  def initialize
    new_deck
  end

  def new_deck
    @cards = []
    Card::SUITS.each do |suit|
      Card::FACES.each do |face|
        @cards << Card.new(suit, face)
      end
    end
    shuffle_deck
  end

  def shuffle_deck
    @cards.shuffle!
  end

  def deal
    new_deck if self.empty?
    @cards.shift
  end

  def empty?
    @cards.size == 0
  end

  def remaining_cards
    @cards.size
  end
end

class Card
  SUITS = %w(H D C S)
  FACES = %w(2 3 4 5 6 7 8 9 10 J Q K A)

  def initialize(suit, face)
    @suit = suit
    @face = face
  end

  def to_s
    "The #{face} of #{suit}"
  end

  def face
    case @face
    when 'J' then 'Jack'
    when 'Q' then 'Queen'
    when 'K' then 'King'
    when 'A' then 'Ace'
    else
      @face
    end
  end

  def suit
    case @suit
    when 'H' then 'Hearts'
    when 'D' then 'Diamonds'
    when 'C' then 'Clubs'
    when 'S' then 'Spades'
    end
  end
end

class Game
  DEALER_DRAW_LIMIT = 17
  SCORE_TO_WIN = 5
  attr_accessor :player, :dealer, :deck

  def initialize
    reset_deck
    display_welcome_message
    set_player
    set_dealer
  end

  def reset_deck
    @deck = Deck.new
  end

  def remaining_cards
    @deck.remaining_cards
  end

  def set_player
    answer = nil
    loop do
      puts "Please enter your name: "
      answer = gets.chomp
      break unless answer.empty?
      puts "Not a valid name!"
    end
    @player = Player.new(answer)
  end

  def set_dealer
    answer = nil
    loop do
      puts "Please enter the dealer name: "
      answer = gets.chomp
      break unless answer.empty?
      puts "Not a valid name!"
    end
    @dealer = Dealer.new(answer)
  end

  def deal_cards
    @player.starting_cards(@deck)
    @dealer.starting_cards(@deck)
  end

  def show_cards(options = { hide: true, clear: false })
    system 'clear' if options[:clear] == true
    puts "Remaining cards in current deck: #{@deck.remaining_cards}"
    print "#{@player.name}: "
    @player.show_cards
    print "#{@dealer.name}: "
    @dealer.show_cards(options)
  end

  def player_turn
    loop do
      break if @player.busted? || @player.got_21?
      show_cards(hide: true, clear: true)
      show_game_score
      puts "Want to hit (h) or stay (s)?"
      answer = gets.chomp.downcase
      if answer.start_with?('h')
        @player.hit(@deck)
      elsif answer.start_with?('s')
        break
      else
        puts "Not a valid choice!"
      end
    end
  end

  def dealer_turn
    if !@player.busted? && !@player.got_21?
      loop do
        break if @dealer.busted? || @dealer.stay?
        show_cards(hide: false, clear: true)
        show_game_score
        puts "Press ENTER key to see the next dealer's card..."
        gets
        @dealer.hit(@deck)
      end
    end
  end

  # rubocop:disable Metrics/AbcSize
  def show_result_and_update_score
    show_cards(hide: false, clear: true)
    if (@player.busted? || @dealer.total > @player.total) && !@dealer.busted?
      puts "#{@dealer.name} wins!"
      @dealer.score += 1
    elsif @dealer.busted? || @player.got_21? || @player.total > @dealer.total
      puts "#{@player.name} wins!"
      @player.score += 1
    else
      puts "It's a tie!"
    end
    show_game_score
    if !someone_won?
      puts "Press ENTER to play the next round..."
      gets
    end
  end
  # rubocop:enable Metrics/AbcSize

  def someone_won?
    @player.score == SCORE_TO_WIN || @dealer.score == SCORE_TO_WIN
  end

  def play_again?
    answer = nil
    loop do
      puts "Want to play again? (y or n)"
      answer = gets.chomp.downcase
      break(answer.start_with?('y')) unless answer.empty?
      puts "Not a valid choice!"
    end
  end

  def reset_game
    puts "Let's Play Again!!"
    reset_deck
    reset_player_cards
    reset_score
  end

  def reset_player_cards
    @player.reset_cards
    @dealer.reset_cards
  end

  def reset_score
    @player.reset_score
    @dealer.reset_score
  end

  def show_game_results
    if @player.score == SCORE_TO_WIN
      puts "#{@player.name} wins the game!! Congratulations!!"
    elsif @dealer.score == SCORE_TO_WIN
      puts "#{@dealer.name} wins the game!! The house always wins!!"
    end
  end

  def show_game_score
    puts "Game Score: "
    puts "#{@player.name} ... #{@player.score}"
    puts "#{@dealer.name} ... #{@dealer.score}"
  end

  def start
    loop do
      loop do
        deal_cards
        show_cards
        player_turn
        dealer_turn
        show_result_and_update_score
        break if someone_won?
        reset_player_cards
      end
      show_game_results
      break unless play_again?
      reset_game
    end
    display_goodbye_message
  end

  def display_welcome_message
    puts "Welcome to Twenty-One!! Good Luck!!"
  end

  def display_goodbye_message
    puts "Thank you for playing Twenty-One!!"
  end
end

Game.new.start

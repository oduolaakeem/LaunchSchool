# twenty_one.rb

require 'pry'

# constants definition
SUITS = %w(H D C S)
VALUES = %w(2 3 4 5 6 7 8 9 10 J Q K A)
MAX_SCORE = 5
GAME_TYPE = 21
DRAW_UNTIL = 17
# end constants definition

# methods definition
def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  deck = []
  SUITS.each do |suit|
    VALUES.each do |value|
      deck << [suit, value]
    end
  end
  deck.shuffle!
end

def deal!(hand, deck, number_of_cards)
  number_of_cards.times { hand[0] << deck.pop }
  hand[1] = hand_value(hand[0])
end

def hand_value(hand)
  value = 0
  hand.each do |card|
    if card[1].to_i.to_s == card[1]
      value += card[1].to_i
    elsif card[1] == "A"
      value += 11
    else
      value += 10
    end
  end

  hand.each do |card|
    value > GAME_TYPE && card.include?("A") ? value -= 10 : next
  end

  value
end

# rubocop:disable Metrics/AbcSize, MethodLength
def display_board(player1_hand, dealer_hand, player1_score, dealer_score, hide_dealer = true)
  system 'clear'
  prompt("Twenty-One Game!!")
  prompt("Dealer hand:")
  dealer_hand_copy = [[], 0]
  dealer_hand_copy[0] = dealer_hand[0].clone
  dealer_hand_copy[1] = dealer_hand[1]
  if hide_dealer
    print "?? "
    dealer_hand_copy[0].shift
    dealer_hand_copy[0].each { |card| print card[0] + card[1] + " " }
    prompt("Value: ??")
  else
    dealer_hand[0].each { |card| print card[0] + card[1] + " " }
    prompt("Value: #{dealer_hand[1]}")
  end
  prompt("Player hand:")
  player1_hand[0].each { |card| print card[0] + card[1] + " " }
  prompt("Value: #{player1_hand[1]}")
  prompt("Partial Score: Player (#{player1_score}); Dealer(#{dealer_score})")
end
# rubocop:enable Metrics/AbcSize, MethodLength

def busted?(hand)
  hand[1] > GAME_TYPE
end

def detect_winner(player1_hand, dealer_hand)
  if player1_hand[1] > dealer_hand[1]
    return "Player"
  elsif player1_hand[1] < dealer_hand[1]
    return "Computer"
  else
    return "None"
  end
end

def play_again?
  prompt("-----------------------------------")
  prompt("Do you want to play again? (y or n)")
  answer = gets.chomp
  answer.downcase.start_with?('y')
end
# end methods definition

# game loop
player_score = 0
dealer_score = 0

prompt("Welcome to the Twenty-One game!")
loop do
  player_score = 0
  dealer_score = 0

  loop do
    break if player_score == MAX_SCORE || dealer_score == MAX_SCORE
    prompt("Initializing and shuffling deck...")
    deck = initialize_deck
  
    # to avoid the calculation over and over again when the total from a hand when needed,
    # i use an array [cards, total], where cards is an array of cards, and
    # total is the total sum of the cards.
    player_hand = [[], 0]
    dealer_hand = [[], 0]
  
    deal!(player_hand, deck, 2)
    deal!(dealer_hand, deck, 2)
  
    loop do
      display_board(player_hand, dealer_hand, player_score, dealer_score, true)
      break if busted?(player_hand) || player_hand[1] == GAME_TYPE
      prompt("Want to hit or stay?")
      answer = gets.chomp
      answer == 'stay' ? break : deal!(player_hand, deck, 1)
    end
  
    if busted?(player_hand)
      dealer_score += 1
      display_board(player_hand, dealer_hand, player_score, dealer_score, false)
      prompt("You are busted! The house wins!")
      prompt("Hit ENTER to play next round.")
      gets.chomp
      next
    elsif player_hand[1] == GAME_TYPE
      player_score += 1
      display_board(player_hand, dealer_hand, player_score, dealer_score, false)
      prompt("Player wins round!")
      prompt("Hit ENTER to play next round.")
      gets.chomp
      next
    else
      prompt("You chose to stay!")
    end
  
    prompt("-----------------------------")
    prompt("Dealer Turn:")
  
    loop do
      display_board(player_hand, dealer_hand, player_score, dealer_score, false)
      break if busted?(dealer_hand) || dealer_hand[1] >= DRAW_UNTIL
      prompt("Hit ENTER to see next dealer card.")
      gets.chomp
      deal!(dealer_hand, deck, 1)
    end
  
    if busted?(dealer_hand)
      player_score += 1
      display_board(player_hand, dealer_hand, player_score, dealer_score, false)
      prompt("Dealer is busted! Player wins!")
      prompt("Hit ENTER to play next round.")
      gets.chomp
    else
      if detect_winner(player_hand, dealer_hand) == "Player"
        player_score += 1
        display_board(player_hand, dealer_hand, player_score, dealer_score, false)
        prompt("Player Wins!")
        prompt("Hit ENTER to play next round.")
        gets.chomp
      elsif detect_winner(player_hand, dealer_hand) == "Computer"
        dealer_score += 1
        display_board(player_hand, dealer_hand, player_score, dealer_score, false)
        prompt("Dealer/House Wins!")
        prompt("Hit ENTER to play next round.")
        gets.chomp
      else
        display_board(player_hand, dealer_hand, player_score, dealer_score, false)
        prompt("It's a Tie! No one Wins!")
        prompt("Hit ENTER to play next round.")
        gets.chomp
      end
      
    end

  end

  if player_score == MAX_SCORE
    prompt("Final Score: Player(#{player_score}); Dealer(#{dealer_score})")
    prompt("Player wins the Match!")
  elsif dealer_score == MAX_SCORE
    prompt("Final Score: Player(#{player_score}); Dealer(#{dealer_score})")
    prompt("Player wins the Match!")
  end
  # the last play again is a little bit different, because as we are in the
  # end of the game, we only need to break the loop, in the previous play_again?
  # Check points we had to go next to avoid the execution of the rest of the
  # program as we already have a winner/loser.
  break unless play_again?
end
# end game loop

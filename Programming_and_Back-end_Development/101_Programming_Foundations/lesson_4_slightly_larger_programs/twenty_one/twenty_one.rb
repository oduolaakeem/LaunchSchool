# twenty_one.rb

require 'pry'

# constants definition
SUITS = %w(H D C S)
VALUES = %w(2 3 4 5 6 7 8 9 10 J Q K A)
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
  number_of_cards.times { hand << deck.pop }
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
    value > 21 && card.include?("A") ? value -= 10 : next
  end

  value
end

# rubocop:disable Metrics/AbcSize, MethodLength
def display_board(player1_hand, dealer_hand, hide_dealer = true)
  system 'clear'
  prompt("Twenty-One Game!!")
  prompt("Dealer hand:")
  dealer_hand_copy = dealer_hand.clone
  if hide_dealer
    print "?? "
    dealer_hand_copy.shift
    dealer_hand_copy.each { |card| print card[0] + card[1] + " " }
    prompt("Value: ??")
  else
    dealer_hand_copy.each { |card| print card[0] + card[1] + " " }
    prompt("Value: #{hand_value(dealer_hand)}")
  end
  prompt("Player hand:")
  player1_hand.each { |card| print card[0] + card[1] + " " }
  prompt("Value: #{hand_value(player1_hand)}")
end
# rubocop:enable Metrics/AbcSize, MethodLength

def busted?(hand)
  hand_value(hand) > 21
end

def detect_winner(player1_hand, dealer_hand)
  if hand_value(player1_hand) > hand_value(dealer_hand)
    prompt("Player Wins!")
  elsif hand_value(player1_hand) < hand_value(dealer_hand)
    prompt("Dealer/House")
  else
    prompt("It's a Tie! No one Wins!")
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
prompt("Welcome to the Twenty-One game!")
loop do
  prompt("Initializing and shuffling deck...")
  deck = initialize_deck

  player_hand = []
  dealer_hand = []

  deal!(player_hand, deck, 2)
  deal!(dealer_hand, deck, 2)

  prompt("-----------------------------")
  prompt("Player Turn:")

  loop do
    display_board(player_hand, dealer_hand, true)
    break if busted?(player_hand) || hand_value(player_hand) == 21
    prompt("Want to hit or stay?")
    answer = gets.chomp
    answer == 'stay' ? break : deal!(player_hand, deck, 1)
  end

  if busted?(player_hand)
    display_board(player_hand, dealer_hand, false)
    prompt("You are busted! The house wins!")
    play_again? ? next : break
  elsif hand_value(player_hand) == 21
    prompt("Player wins!")
    play_again? ? next : break
  else
    prompt("You chose to stay!")
  end

  prompt("-----------------------------")
  prompt("Dealer Turn:")

  loop do
    display_board(player_hand, dealer_hand, false)
    break if busted?(dealer_hand) || hand_value(dealer_hand) > 16
    prompt("Hit ENTER to see next dealer card.")
    answer = gets.chomp
    deal!(dealer_hand, deck, 1)
  end

  if busted?(dealer_hand)
    display_board(player_hand, dealer_hand, false)
    prompt("Dealer is busted! Player wins!")
    play_again? ? next : break
  else
    display_board(player_hand, dealer_hand, false)
    detect_winner(player_hand, dealer_hand)
  end

  break unless play_again?
end
# end game loop

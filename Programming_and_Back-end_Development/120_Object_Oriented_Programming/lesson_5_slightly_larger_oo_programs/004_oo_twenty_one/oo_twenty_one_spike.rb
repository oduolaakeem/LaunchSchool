# Twenty-One Game

# Twenty-One is a card game consisting of a dealer and a player, where the 
# participants try to get as close to 21 as possible without going over.

# Here is an overview of the game:
# - Both participants are initially dealt 2 cards from a 52-card deck.
# - The playe takes the first turn, and can "hit" or "stay".
# - If the player busts, he loses. if he stays, it's the dealer's turn.
# - The dealer must hit until his cards add up to at least 17.
# - If he busts, the player wins. If both player and dealer stays, the the
#   highest total wins.

# Nouns and Verbs
# Nouns: card, player, dealer, participant, deck, game, total
# Verbs: deal, hit, stay, busts

# Organizing Nouns and Verbs...

# Player
# - hit
# - stay
# - busted?
# - total
# Dealer
# - hit
# - stay
# - busted?
# - total
# - deal (should this be here, or in Deck?)
# Participant
# Deck
# - deal (should this be here, or in Dealer?)
# Card
# Game
# - start

class Player
  def initialize
    # what would be the data or states of a Player object entail?
    # maybe cards? a name?
  end
  
  def hit
  end
  
  def stay
  end
  
  def busted?
  end
  
  def total
    # definitely looks like we need to know about "cards" to produce some total
  end
end

class Dealer
  def initialize
    # seems like very similar to Player... do we even need this?
  end
  
  def deal
  end
  
  def hit
  end
  
  def stay
  end
  
  def busted?
  end
  
  def total
  end
end

class Participant
  # what goes in here? all the redundancate behaviors from Player and Dealer?
end

class Deck
  def initialize
    # obviously, we need some data structure to keep track of cards
    # array, hash, something else?
  end

  def deal
    # does the dealer or the deck deal?
  end
end

class Card
  def initialize
    # what are the states of a card?
  end
end

class Game
  def start
    # what is the sequence of steps to execute the game play?
  end
end

Game.new.start
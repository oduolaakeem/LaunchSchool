# rock: r
# paper: p
# scissors: sc
# lizard: l
# spock: sp
VALID_CHOICES = %w(r p sc l sp)

def prompt(message)
  Kernel.puts("=> #{message}")
end

def win?(first, second)
  (first == 'r' && second == 'sc') ||
    (first == 'r' && second == 'l') ||
    (first == 'p' && second == 'sp') ||
    (first == 'p' && second == 'r') ||
    (first == 'sc' && second == 'p') ||
    (first == 'sc' && second == 'l') ||
    (first == 'l' && second == 'sp') ||
    (first == 'l' && second == 'p') ||
    (first == 'sp' && second == 'r') ||
    (first == 'sp' && second == 'sc')
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

loop do
  player_score = 0
  computer_score = 0
  loop do
    choice = ''
    loop do
      prompt("Your score: #{player_score}; Computer score: #{computer_score}")
      prompt("---------------------------------------------------------------------")
      prompt("Choose one: rock (r), paper (p), scissors (sc), lizard (l), spock (sp)")
      choice = Kernel.gets().chomp()

      if VALID_CHOICES.include?(choice)
        break
      else
        prompt("That's not a valid choice.")
      end
    end

    computer_choice = VALID_CHOICES.sample

    Kernel.puts("You chose: #{choice}; Computer chose: #{computer_choice}")

    display_results(choice, computer_choice)

    if win?(choice, computer_choice)
      player_score += 1
    elsif win?(computer_choice, choice)
      computer_score += 1
    end

    if player_score >= 5
      prompt("Player wins!")
      break
    elsif computer_score >= 5
      prompt("Computer Wins!")
      break
    end
  end
  prompt("Do you want to play again?")
  answer = Kernel.gets().chomp()
  break unless answer.downcase.start_with?('y')
end

prompt("Thank you for playing. Good bye!")

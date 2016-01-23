# Pseudo Code
# START
# GET the loan ammount
# GET the APR
# GET the loan duration
# SET calculate the monthly interest rate with the info gathered above
# SET calculate the loan duration in months
# PRINT the results
# END

def prompt(message)
  puts "=>" + message
end

def integer?(num)
  num.to_i.to_s == num
end

def float?(num)
  num.to_f.to_s == num
end

def valid_number?(num)
  (integer?(num) || float?(num)) && num.to_f > 0 && !num.empty?
end

prompt("Welcome to the mortgage calculator!!")
prompt("------------------------------------")

loop do
  loan_amount = nil

  loop do
    prompt("Enter the loan amount: ")
    loan_amount = gets.chomp
    valid_number?(loan_amount) ? break : prompt("Oops!! Please enter a valid value for the loan amount.")
  end
  apr = nil
  loop do
    prompt("Enter the Anual Percentage Rate (APR): (%) ")
    apr = gets.chomp
    valid_number?(apr) ? break : prompt("Oops!! Please enter a valid value for the APR.")
  end
  loan_duration_months = nil
  loop do
    prompt("Enter the loan duration in months: ")
    loan_duration_months = gets.chomp
    integer?(loan_duration_months) ? break : prompt("Oops!! Please enter a valid value for the loan duration in months.")
  end
  monthly_interest_rate = apr.to_f / 12.0
  prompt("Your monthly interest rate will be #{format('%02.2f', monthly_interest_rate)}%.")
  monthly_interest_rate /= 100.0
  loan_amount = loan_amount.to_f
  loan_duration_months = loan_duration_months.to_f
  monthly_payments = loan_amount * (monthly_interest_rate * ((1 + monthly_interest_rate)**loan_duration_months)) / (((1 + monthly_interest_rate)**loan_duration_months) - 1)
  prompt("The amount of your monthly payments will be $#{format('%02.2f', monthly_payments)}.")
  prompt("The duration of the loan is estimated to be #{loan_duration_months} months.")
  prompt("Want to perform another calculation? (Y to calculate again)")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thank you for using the Mortgage Calculator")

prompt("Good Bye!!")

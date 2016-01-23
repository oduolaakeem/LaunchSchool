
#Pseudo Code

# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# ouput the result

require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')
LANGUAGE = 'es'

def messages(message, lang = 'en')
  MESSAGES[lang][message]
end

def prompt(key)
  message = messages(key, LANGUAGE)
  Kernel.puts("=> #{message}")
end

def integer?(num)
  num.to_i.to_s == num
end

def float?(num)
  num.to_f.to_s == num
end

def valid_number?(num)
  integer?(num) || float?(num)
end

def operation_to_message(op)
  case op
  when '1'
    MESSAGES[LANGUAGE]['adding']
  when '2'
    MESSAGES[LANGUAGE]['subtracting']
  when '3'
    MESSAGES[LANGUAGE]['multiplying']
  when '4'
    MESSAGES[LANGUAGE]['dividing']
  end
end

prompt('welcome')

name = ''

loop do
  name = Kernel.gets().chomp()
  if name.empty?()
    prompt('valid_name')
  else
    break
  end
end


Kernel.puts(MESSAGES[LANGUAGE]['hi'] + " #{name}")

loop do
  number1 = nil
  loop do
    prompt('first_number')
    number1 = Kernel.gets().chomp()
    if valid_number?(number1)
      break
    else
      prompt('invalid_number')
    end
  end
  number2 = nil
  loop do
    prompt('second_number')
    number2 = Kernel.gets().chomp()
    if valid_number?(number2)
      break
    else
      prompt('invalid_number')
    end
  end
  # operator_prompt = <<-MSG
  #   What operation would you like to perform?
  #   1) add
  #   2) subtract
  #   3) multiply
  #   MESSAGES['']
  # MSG
  prompt('operation')
  operator = ''
  loop do
    operator = Kernel.gets().chomp()
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt('invalid_operator')
    end
  end
  Kernel.puts("#{operation_to_message(operator)} " + MESSAGES[LANGUAGE]['operation_apllied_to'])
  result = case operator
           when '1'
             number1.to_f() + number2.to_f()
           when '2'
             number1.to_f() - number2.to_f()
           when '3'
             number1.to_f() * number2.to_f()
           when '4'
             number1.to_f() / number2.to_f()
           end
  Kernel.puts(MESSAGES[LANGUAGE]['result'] + "#{result}")
  prompt('again')
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end
prompt(MESSAGES['closing_message'])

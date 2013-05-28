guess_count = 0

#This could be static if I knew the syntax....
def check_guess (guess, answer)
  if guess == answer
    puts 'Correct!'
    return true
  elsif guess < answer
    puts 'Guess higher!'
    return false
  elsif guess > answer
    puts 'Guess lower!'
    return false
  end
end

answer = rand(100) + 1
while (complete == false)
  puts 'Guess a number between 1-100:'
  guess = gets.to_i
  guess_count = guess_count + 1
  if check_guess(guess, answer)
    exit
  end
end

puts 'It took you ' + guess_count.to_s + ' guesses!'

def game
  num = rand 25
  puts "Guess a number between 0 and 24"

  loop do
    user_answer = gets.chomp.to_i

    if user_answer == num
      puts "Yay, you got it right!"
      break
    elsif user_answer > num
      puts "Lower - guess again"
    else
      puts "Higher - guess again"
    end
  end
end

game

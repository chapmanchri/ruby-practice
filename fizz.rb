#fizz.rb
#Chris Chapman
#July 29, 2015

1.upto(100) do |counter|
  #if coutner is a multiple of 3 puts Fizz
  if counter % 3 == 0 and counter % 5 == 0
    puts "FizzBuzz"
  elsif counter % 3 == 0
    puts "Fizz"
  elsif counter % 5 == 0
    puts "Buzz"
  else
    puts counter
  end
end


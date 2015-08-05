#Chris Chapman
# July 26, 2015
# method that takes arguments

def always(number)
  number = ((number+5)*2-4)/2
  puts "Always #{number}" 
end


print "Give me a number: "
number = gets.chomp.to_i
always(number)

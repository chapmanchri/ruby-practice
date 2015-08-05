# get me a number
# Chris Chapman  - July 21, 2015
# get number from user
def always
  print "Give me a number: "
  number = gets.chomp.to_i
  puts ((number+5)*2-4)/2
end

always


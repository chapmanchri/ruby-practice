# get me a number
# Chris Chapman  - July 18, 2015
print "Give me a number: "
number = gets.chomp.to_i
puts "Thank you for giving me #{number}."
number += 5
puts "Adding 5 = #{number}."
number *= 2
puts "Multiplying by 2 = #{number}."
number -= 4
puts "Subtracting 4 = #{number}."
number /= 2
puts "Dividing by 2 = #{number}."
puts "The final number is #{number}."

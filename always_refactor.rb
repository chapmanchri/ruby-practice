# get me a number
# Chris Chapman  - July 21, 2015
# get number from user
print "Give me a number: "
original_number = gets.chomp.to_i
# add 5 to original_number
original_number += 5
# multiply the modified original_number by 2
original_number *= 2
# subtract 4 from the modified original_number
original_number -= 4
# divide the the original_number by 2
original_number /= 2
#set the final_number to the modified original_number
final_number = original_number
# display the final_number
puts "The final number is #{original_number}."
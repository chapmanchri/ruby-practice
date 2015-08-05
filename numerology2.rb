#numerology2 app
#Chris Chapman
#July 27, 2015



def get_birthpath(birthdate)
  #determine birthpath
  #break date into a string of characters and put them in array
  birthdate_array = birthdate.split(//)

  # add numbers in array until they are less than 10
  birthpath = 0
  keep_going = 1
  while keep_going == 1
    birthdate_array.each do |x|
     birthpath  += x.to_i  # bsum += x.to_i
    end
    birthdate_array = birthpath .to_s.split(//)
    if birthpath  < 10
      keep_going = 0
    else
      birthpath  = 0
    end
  end
  return birthpath
  
end

def get_message(birthpath)
  case birthpath 
  when 1
    return "\n\nOne is the leader. The number one indicates the ability to stand alone, and is a strong vibration.\n\nRuled by the Sun.\n\n"
  when 2
    return "\n\nThis is the mediator and peace-lover. The number two indicates the desire for harmony. It is a gentle, considerate, and sensitive vibration. \n\nRuled by the Moon.\n\n
  "
  when 3
    return "\n\nNumber Three is a sociable, friendly, and outgoing vibration. Kind, positive, and optimistic, Three’s enjoy life and have a good sense of humor.\n\nRuled by Jupiter.\n\n"
  when 4
    return "\n\nThis is the worker. Practical, with a love of detail, Fours are trustworthy, hard-working, and helpful.\n\nRuled by Uranus.\n\n"
  when 5
    return "\n\nThis is the freedom lover. The number five is an intellectual vibration. These are \"idea\" people with a love of variety and the ability to adapt to most situations.\n\nRuled by Mercury.\n\n"
  when 6
    return "\n\nThis is the peace lover. The number six is a loving, stable, and harmonious vibration.\n\nRuled by Venus.\n\n"
  when 7
    return "\n\nThis is the deep thinker. The number seven is a spiritual vibration. These people are not very attached to material things, are introspective, and generally quiet.\n\nRuled by Neptune.\n\n"
  when 8
    return "\n\nThis is the manager. Number Eight is a strong, successful, and material vibration.\n\nRuled by Saturn.\n\n"
  when 9
    return "\n\nThis is the teacher. Number Nine is a tolerant, somewhat impractical, and sympathetic vibration.\n\nRuled by Mars.\n\n"
  else
    return "You did not enter birthday."
  end
end

#get birthdate
print "Please enter your birthdate (mmddyyyy):"
birthdate = gets.chomp
puts "You entered: #{birthdate}\n\n"
birthpath = get_birthpath(birthdate)
message = get_message(birthpath)
puts "You're birthpath is #{birthpath} and your message is:#{message}"



class Learner
  
  def initialize(name)
    #puts "a learner"
    @name = name
  end
  
  def getName
    return @name
  end
  
  attr_accessor :name
  
end

class BuildQuestionBank

  def initialize()
    #get the question file from user input
    questionFile = getFileName()
    #get the qustions in an array format - two dimensional array
    @allQuestions = buildQuestionArray(questionFile)
  end
  
  attr_accessor :allQuestions

  def getFileName()
    # prompt user for filename
    puts "Enter the name of the file that has your questions:"
    print "> "
    filename = $stdin.gets.chomp
    # assign file to file object and return the file object
    questionFile = open(filename)
    return questionFile 
  end

  def buildQuestionArray(questionFile)
    #allQuestions is a two dimensional array
    #each array element holds a secondary array
    #the secondary elements of the array contain the question
    # 0 - question stem
    # 1 - number_of-options -- the options
    # last element - the correct answer -e.g., if option 2 is correct
    # it would be in element 2 and the last element would contain "2"
    allQuestions = []
    counter = 0
    #loop through each line of the file
    # split each item in the file (comma delimited) into an array and stort
    # this array in an element of allQuestions
    # repeat until all question lines are read from the file
    questionFile.each do |line|
      #allQuestions[counter] = singleQuestion = line.split(/\,/)
      #allQuestions[counter] = line.split(/\,/)
      allQuestions[counter] = line.chomp.split(/\,/)
      correctAnswer = 0
      iCounter = 0
      allQuestions[counter].each do |item|
        if item.end_with?("*")
          # set correct answer to the current element in the sub array
          correctAnswer = iCounter
          # replace option with option stripped of the *
          allQuestions[counter][iCounter] = item.chop
        end
        iCounter += 1
      end
      allQuestions[counter].push(correctAnswer.to_i)
      counter += 1
    end
    
    # return all of the questions in the allQuestions array
    return allQuestions
    
  end
  
  def determineCorrectAnswer
    
  end

end



class Tutor
  
  def initialize(my_student, my_questions)
    @my_student = my_student
    @my_questions = my_questions
  end
  
  def display_student_name()
    puts "Hello #{@my_student.name}"
  end
  
  def ask_a_question(counter)
    # put in a loop that goes through each element of @my_questions
    
    #puts @my_questions.length
    # counter = 0
#     @my_questions.each do |questionNum|
#       puts counter
#       counter += 1
    
    # ask the learner a question
      puts "Please answer the following question:"
      #@my_question.each {|i| puts i}
      x = 0
      while x < (@my_questions[counter].length-1) do
        if x > 0
          print "#{x}. "
        end
        puts @my_questions[counter][x]
        x += 1
      end
    # end
  end
  
  
  
  def get_response()
    # prompt the learner for a response
    print "> "
    @answer = $stdin.gets.chomp
    puts "\nYou answered #{@answer}\n\n"
  end
  
  def evaluate_response(counter)
   # puts @answer
    #get length of current question
    correctAnswerIndex =  @my_questions[counter].length-1
    # correct answer - word
    correctAnswer = @my_questions[counter][2]
    # get the correct answer in the sub array
    # puts @my_questions[0][@my_questions[0][correctAnswerIndex]]
    # puts "the correctAnswer is #{correctAnswer}"
    # puts "correctAnswerIndex  is #{correctAnswerIndex}"
    # puts @my_questions[0][correctAnswerIndex]
    # evaluate the response and tell the learner if they are right or wrong
    if @answer.to_i == @my_questions[counter][correctAnswerIndex].to_i
       puts "Yes!\n\n"
    else
       puts "Incorrect. - the correct answer is #{@my_questions[counter][@my_questions[counter][correctAnswerIndex]]}.\n\n"
    end
  end
  
  def askAllQuestions
    #put in a loop that goes through each element of @my_questions

    #puts @my_questions.length
    counter = 0
    @my_questions.each do |questionNum|
      #puts counter
      
      ask_a_question(counter)
      get_response()
      evaluate_response(counter)
      
      counter += 1
    end
  end
  
end

# run the program
chris = Learner.new('Chris Michael Chapman')
puts chris.getName()
my_questions = BuildQuestionBank.new()
#puts my_questions.allQuestions[0]
doc = Tutor.new(chris, my_questions.allQuestions)
doc.display_student_name()
# # doc.ask_a_question()
# # doc.get_response()
# # doc.evaluate_response()
# doc.ask_a_question()
# doc.get_response()
# doc.evaluate_response()
doc.askAllQuestions()

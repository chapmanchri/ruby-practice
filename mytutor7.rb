class Learner
  
  def initialize(name)
    #initialize the learner name
    @name = name
  end
  
  def getName()
    #return the name of the learner
    return @name
  end
    
end

class BuildQuestionBank

  def initialize()
    #get the question file from user input
    questionFile = getFileName()
    #get the qustions in an array format - two dimensional array
    @allQuestions = buildQuestionArray(questionFile)
  end

  def getFileName()
    # prompt user for filename
    puts "Enter the name of the file that has your questions:"
    print "> "
    filename = $stdin.gets.chomp
    # assign file to file object and return the file object
    questionFile = open(filename)
    return questionFile 
  end
  
  def getQuestions()
    # return the questions in the form of an array
    return @allQuestions
  end

  def buildQuestionArray(questionFile)
    #aaQuestions is an array that will hold the questions from the questionFile
    #allQuestions is a two dimensional array
    #each array element holds a secondary array
    #the secondary elements of the array contain the question
    # 0 - question stem
    # 1 - number_of-options -- the options
    # last element - the correct answer -e.g., if option 2 is correct
    # it would be in element 2 and the last element would contain "2"
    allQuestions = []
    #currentQuestionNumber holds the number of the current question being processed
    #it is equilivelent to the line number in questionFile
    currentQuestionElement = 0
    #loop through each line of the file
    # load each line into the allQuestions array
    # repeat until all question lines are read from the file
    questionFile.each do |questionLine|
      #each question element on the line is delimited with a comma
      #use the split command to put the entire line into the allQuestions array at 
      #element countter
      allQuestions[currentQuestionElement] = questionLine.chomp.split(/\,/)
      #correctAnswerElement will hold the number of the element of the array that holds the corrent answer
      #initialize it to 0
      correctAnswerElement = 0
      #for each element in the currentQuestionElement we are going to loop through it
      # to identify the correct answer option (option that ends with *
      # when we locate that option we will remove the * from it
      # and we will record the element number that it sits in 
      # and push it to the array holding the question
      # currentItemElement holds the element of the current question part being processed 
      # (e.g., currentItemElement[0] would be the question stem, currentItemElement[1] would be the
      # first option, etc.)
      currentItemElement = 0
      #loop through the current question
      allQuestions[currentQuestionElement].each do |item|
        if item.end_with?("*")
          # set correct answer to the current element in the sub array
          correctAnswerElement = currentItemElement
          # replace the correct option with itself stripped of the * by chopping the *
          allQuestions[currentQuestionElement][currentItemElement] = item.chop
        end
        currentItemElement += 1
      end
      #push the correctAnswerElement to the currentQuestion
      allQuestions[currentQuestionElement].push(correctAnswerElement)     
      currentQuestionElement += 1
    end
    
    # return all of the questions in the allQuestions array
    return allQuestions
    
  end
  
end



class Tutor
  
  def initialize(my_student, my_questions)
    @my_student = my_student
    @my_questions = my_questions
  end
  
  def display_student_name()
    puts "Hello #{@my_student.getName()}"
  end
  
  def ask_a_question(currentQuestion)
    # put in a loop that goes through each element of @my_questions
    
    #puts @my_questions.length
    # counter = 0
#     @my_questions.each do |questionNum|
#       puts counter
#       counter += 1
    
    # ask the learner a question
      puts "Please answer the following question:"
      #@my_question.each {|i| puts i}
      currentItemElement = 0
      # loop through all of the elements of the array except the last one
      # as the last one holds the correct anser
      while currentItemElement < (@my_questions[currentQuestion].length-1) do
        # if the currentItemElement is not the question stem, print the number
        # of the question option with a period and a space following it.
        if currentItemElement > 0
          print "#{currentItemElement}. "
        end
        # puts the question stem or option
        puts @my_questions[currentQuestion][currentItemElement]
        # move to the next element in the array
        currentItemElement += 1
      end
    # end
  end
  
  
  def get_response()
    # prompt the learner for a response
    print "> "
    # store the response in @answer
    @answer = $stdin.gets.chomp
    puts "\nYou answered #{@answer}\n\n"
  end
  
  def evaluate_response(currentQuestion)
   # puts @answer
    #get length of current question
    correctAnswerIndex =  @my_questions[currentQuestion].length-1
    # correct answer - word
    correctAnswer = @my_questions[currentQuestion][2]
    # get the correct answer in the sub array
    # puts @my_questions[0][@my_questions[0][correctAnswerIndex]]
    # puts "the correctAnswer is #{correctAnswer}"
    # puts "correctAnswerIndex  is #{correctAnswerIndex}"
    # puts @my_questions[0][correctAnswerIndex]
    # evaluate the response and tell the learner if they are right or wrong
    if @answer.to_i == @my_questions[currentQuestion][correctAnswerIndex].to_i
       puts "Yes!\n\n"
    else
       puts "Incorrect. - the correct answer is #{@my_questions[currentQuestion][@my_questions[currentQuestion][correctAnswerIndex]]}.\n\n"
    end
  end
  
  def askAllQuestions
    #put in a loop that goes through each element of @my_questions
    #set currentQuestion to 0 - first element in the @my_questions array
    currentQuestion = 0
    # loop through each question
    @my_questions.each do |questionNum|
      # tutor asks question
      ask_a_question(currentQuestion)
      # get response from learner
      get_response()
      # tutor evaluates response
      evaluate_response(currentQuestion)
      # increment currentQuestion counter
      currentQuestion += 1
    end
  end
  
end

# run the program
chris = Learner.new('Chris Michael Chapman')
my_questions = BuildQuestionBank.new()
doc = Tutor.new(chris, my_questions.getQuestions())
doc.display_student_name()
doc.askAllQuestions()

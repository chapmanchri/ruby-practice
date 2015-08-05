# question_manager.rb

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

questions = BuildQuestionBank.new()
puts "*" * 20
puts "\n\nThere are #{questions.allQuestions.length} questions:\n\n"
questions.allQuestions.each do |question|
  question.each { |item| puts item}
  puts "-" * 20
end



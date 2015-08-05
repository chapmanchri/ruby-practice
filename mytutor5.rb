class Learner
  
  def initialize(name)
    #puts "a learner"
    @name = name
  end
  
  attr_accessor :name
  
end

class Question
  
  def initialize()
    #I would like to return the array that holds the questions here
    question_file = get_quesiton_file()
    @questions = create_questions(question_file)
    #puts "in Question initialize @questions = #{@questions}"
  end
  
  attr_accessor :questions, :correct_option
  
  def get_quesiton_file()
    puts "Enter the name of the file that has your questions:"
    print "> "
    filename = $stdin.gets.chomp
    question_file = open(filename)
  end
  
  def create_questions(file)
    question_file = file
    question_array = [""]
    counter = 0
    @correct_option = 0
    
    #while (not question_file.eof?)
    while question_array[counter] != "-"
      
       #add current file line to queston_array
       question_array.push(question_file.gets.chomp)
       
       #if what is in the array is a- I want to exit
       
       #check to see if end of question charcter line "-"
       # if question_array[counter] == "-"
       #   # end of question reached
       #   # shoould return question_array
       # end
       #
       #if question_array[counter] != "-"
       
         if question_array[counter].end_with?("*")
           @correct_option = counter
           question_array[counter] = question_array[counter].chop
         end
         
         #end
       
       counter += 1      
    end
    
    return question_array
    
    
  end
  
end

class Tutor
  
  def initialize(my_student, my_question, correct_answer)
    @my_student = my_student
    @my_question = my_question
    @correct_answer = correct_answer
  end
  
  def display_student_name()
    puts "Hello #{@my_student.name}"
  end

  def ask_questions()
    want_question = true
    while want_question
      puts "in loop"
      ask_a_question()
      get_response()
      evaluate_response()
      print "Another queston? > "
      want_question = $stdin.gets.chomp
      if want_question == "" then
        want_question = true
      else
        want_question = false
      end
    end  
  end
  
  
  def ask_a_question()
    # ask the learner a question
    puts "Please answer the following question:"
    #@my_question.each {|i| puts i}
    x = 0
    while x < (@my_question.length) do
      if x > 0
        print "#{x}. "
      end
      puts @my_question[x]
      x += 1
    end
  end
  
  def get_response()
    # prompt the learner for a response
    print "> "
    @answer = $stdin.gets.chomp
    puts "\nYou answered #{@answer}\n\n"
  end
  
  def evaluate_response()
    # evaluate the response and tell the learner if they are right or wrong
    if @answer.to_i == @correct_answer.to_i
      puts "Yes!\n\n"
    else
      puts "Incorrect - the correct answer is #{@my_question[@correct_answer.to_i]}.\n\n"
    end
  end
  
end

# run the program
chris = Learner.new('Chris Michael Chapman')
my_question = Question.new()
doc = Tutor.new(chris, my_question.questions, my_question.correct_option)
doc.display_student_name()
# doc.ask_a_question()
# doc.get_response()
# doc.evaluate_response()
doc.ask_questions()

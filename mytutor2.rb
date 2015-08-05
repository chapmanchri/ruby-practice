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
  end
  
  attr_accessor :questions
  
  def get_quesiton_file()
    puts "Enter the name of the file that has your questions:"
    print "> "
    filename = $stdin.gets.chomp
    question_file = open(filename)
  end
  
  def create_questions(file)
    question_file = file
    question_array = []
    while (not question_file.eof?)
       #add current file line to queston_array
       question_array.push(question_file.gets.chomp)
    end
    return question_array
    #question_array.each {|i| puts i}
  end
  
end

class Tutor
  
  def initialize(my_student, my_question)
    @my_student = my_student
    @my_question = my_question
  end
  
  def display_student_name()
    puts "Hello #{@my_student.name}"
  end

  
  def ask_a_question()
    # ask the learner a question
    puts "Please answer the following question:"
    #@my_question.each {|i| puts i}
    x = 0
    while x < (@my_question.length - 1) do
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
    if @answer == @my_question.last
      puts "Yes!\n\n"
    else
      puts "Incorrect - the correct answer is #{@my_question.last}.\n\n"
    end
  end
  
end

# run the program
chris = Learner.new('Chris Michael Chapman')
my_question = Question.new()
doc = Tutor.new(chris, my_question.questions)
doc.display_student_name()
doc.ask_a_question()
doc.get_response()
doc.evaluate_response()

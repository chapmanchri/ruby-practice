class Parent
  def initialize()
    puts "PARENT initialize()"
  end
  
  def override()
    puts "PARENT override()"
  end
end

class Child < Parent
  def initialize(stuff)
    @stuff = stuff
    puts "stuff = #{@stuff}"
    super()
  end
  
  def override()
    puts "CHILD override()"
  end
end


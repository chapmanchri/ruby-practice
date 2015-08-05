class Parent
  def override()
    puts "PARENT override()"
  end
  
  def implicit()
    puts "PARENT implicit()"
  end
  
  def altered()
    puts "PARENT altered()"
  end
end

class Child < Parent
  #calling this method will override the same method from the Parent class
  def override()
    puts "CHILD override()"
  end
  
  #calling this method will first override the Parent method, then call it, then override it
  def altered()
    puts "CHILD, BEFORE PARENT altered()"
    super()
    puts "CHILE, AFTER PARENT altered()"
  end
end
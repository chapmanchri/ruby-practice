#Chris Chapman
#my_pet

class MyPet
  def set_name= (name)
    @name = name
  end
  
  def get_name
    return @name
  end
  
  def set_owner= (owner)
    @owner = owner
  end
  
  def get_owner
    return @owner
  end
  
  def greeting
    return "Hello big dog!"
  end
end

sam = MyPet.new
sam.set_name= "Dave"
sam.set_owner="Chris"
puts sam.get_name
puts sam.get_owner
puts sam.greeting

puts "sam.inspect: \n\n #{sam.inspect}"



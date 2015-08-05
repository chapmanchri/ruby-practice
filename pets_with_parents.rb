#pets_withParents.rb
#Chris Chapman
#August 2, 2015

class Pet
  
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
  
end

class Chinchilla < Pet
  def bark
    return "woof woof"
  end
end

class Ferret < Pet
  def squeal
    return "squeeeel"
  end
end

class Parrot < Pet
  def tweet
    return "tweet yak chrip"
  end
end

 
my_ferret = Ferret.new
my_ferret.set_name= "Fredo"
my_ferret.set_owner= "Chris"
 
my_parrot = Parrot.new
my_parrot.set_name= "Waldo"
my_parrot.set_owner= "Chris"
 
my_chinchilla = Chinchilla.new
my_chinchilla.set_name= "Sparky"
my_chinchilla.set_owner= "Chris"
 
puts "#{my_ferret.get_name} says #{my_ferret.squeal}, 
#{my_parrot.get_name} says #{my_parrot.tweet}, 
and #{my_chinchilla.get_name} says #{my_chinchilla.bark}."
 
puts my_ferret.inspect
puts my_parrot.inspect
puts my_chinchilla.inspect
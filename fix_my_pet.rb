#fix_my_pet.rb
class Pet
 
  def set_pet_type= (pet_type)
    @pet_type = pet_type
  end
 
	def set_name= (name)
		@name = name
	end
 
	def get_name
		return @name
	end
 
	def set_owner=(owner_name)
		@owner_name = owner_name
	end
 
	def get_owner
		return @owner_name
	end
 
	def squeal
		return "squeeeeee"
	end
 
end
 
my_ferret = Pet.new
my_ferret_type= "Ferret"
my_ferret.set_name= "Fredo"
ferretname = my_ferret.get_name
 
my_parrot = Pet.new
my_parrot_type= "Parrot"
my_parrot.set_name= "Budgie"
parrotname = my_parrot.get_name
 
my_chincilla = Pet.new
my_chincilla_type = "Chincilla"
my_chincilla.set_name= "Dali"
chincillaname = my_chincilla.get_name
 
puts "#{ferretname} says #{my_ferret.squeal}, 
#{parrotname} says #{my_parrot.squeal}, 
and #{chincillaname} says #{my_chincilla.squeal}."
 
puts my_ferret.inspect
puts my_parrot.inspect
puts my_chincilla.inspect
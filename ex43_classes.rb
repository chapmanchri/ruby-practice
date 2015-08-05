class Scene
  def enter()
    puts "This scene is not yet configured. Subclass it and implement enter()."
    exit(1)
  end
end


class Engine
  
  def initialize(scene_map)
    @scene_map = scene_map
  end
  
  def play()
    current_scene = @scene_map.opening_scene()
    last_scene = @scene_map.next_scene('finished')
    puts "************ in play *******************"
    puts "current_scene = #{current_scene}"
    puts "last_scene = #{last_scene}"
    
    while current_scene != last_scene
      puts "in play while loop"
      puts "current_scene is #{current_scene}"
      next_scene_name = current_scene.enter()
      puts "next_scene_name = #{next_scene_name}"
      current_scene = @scene_map.next_scene(next_scene_name)
      puts "current_scene in the while loop is #{current_scene}"
    end
#
#     # be sure to print out the last scene
    puts "out of play while loop"
    puts "current_scene is now #{current_scene}"
    #current_scene.enter()
    exit(1)
  end

end

class Death < Scene
  
  @@quips = [
    "You died. You kinda suck at this.",
    "Your mom would be proud...if she were smarter.",
    "Such a luser",
    "I have a small puppy that's better at this."
  ]
  
  def enter()
    puts @@quips[rand(0..(@@quips.length - 1))]
    exit(1)
  end
end

class CentralCorridor < Scene
  
  def enter()
    puts "The Gothons of Planet Percal #25 have invaded your ship and destroyed"
    puts "your entire crew. You are the last surviving member and your last"
    puts "mission is to get the neutron destruct bomb from the Weapons Armory,"
    puts "put it in the bridege, and blow the ship up after getting into an"
    puts "escape pad."
    puts "\n"
    puts "You're running down the central corridor to the Weapons Armory when"
    puts "a Gothon jumps out, red scaly skin, dark grimy teeth, and evil clown costume"
    puts "flowing around his hate filled body. He's blocking the door to the"
    puts "Armory and about to pull a weapon to blast you."
    print "> "
    action = $stdin.gets.chomp
    
    if action == "shoot!"
      puts "Quick on the draw you yank out your blaster and fire it at the Gothon."
      puts "His clown costume is flowing and moving around his body, which throws"
      puts "off your aim. Your laser hits his costume but misses him entirely. This"
      puts "completely ruins his brand new costume his mother bought him, which"
      puts "makes him fly into an insane rage and blast you repeatedly in the face until"
      puts "you are dead. Then he eats you."
      return 'death'
      
    elsif action == "dodge!"
      puts "Like a world calss boxer you dodge, weave, slip and slide right"
      puts "as the Gothon's blaster cranks a laser past your head."
      puts "In the middle of your artful dodge your foot slips and you"
      puts "bang your head on the metal wall and pass out."
      puts "You wake up shortly after only to die as the Gothon stomps on"
      puts "your head and eats you."
      return 'death'
      
     elsif action == "tell a joke"
       puts "Lucky for you they made you learn Gothon insults in the academy."
       puts "You tell the one Gothon joke you know:"
       puts "Lbhe zbgure vf fb sng, jura fur fvgf nebhaq gur ubhfr, fur fvgf nebhaq gur ubhfr."
       puts "The Gothon stops, treis not to laugh, then busts our laughing and can't move."
       puts "While he's laughing you run up and shoot him square in the head"
       puts "putting him down, then jump throught the Weapon Armory door."
       return 'laser_weapon_armory'
       
     else
       puts "DOES NOT COMPUTE!"
       return 'central_corridor'
     end
   end
 end


class LaserWeaponArmory < Scene
  
  def enter()
    puts "You do a dive roll into the Weapon Armory, crouch and scan the room"
    puts "for more Gothons that might be hiding. It's dead quiet, too quiet."
    puts "You stand up and run to the far side of the room and find the"
    puts "neutron bomb in its container. There's a keypad lock on the box"
    puts "and you need the code to get the bomb out. If you get the code"
    puts "wrong 10 times then the lock closes forever and you can't"
    puts "get the bomb. The code is 3 digits."
    code = "#{rand(1..9)} #{rand(1..9)} #{rand(1..9)}"
    puts "code = #{code}"
    print "[keypad]> "
    guess= $stdin.gets.chomp
    guesses = 0
    
    while guess != code && guesses < 10
      puts "BZZZZEDDD"
      guesses += 1
      print "[keypad]> "
      guess = $stdin.gets.chomp
    end
    
    if guess == code
      puts "The container clicks open and the seal breaks, letting gas out."
      puts "You grab the neutron bomb and run as fast as you can to the "
      puts "bridge where you must place it in the right spot."
      return 'the_bridge'
    else
      puts "The lock buzzes one last time and then you hear a sickening"
      puts "melting sound as the mechanism is fused together."
      puts "You decide to sit there, and finally the Gothons blow up the"
      puts "ship from their ship and you die."
      return 'death'
    end
  end
end

class TheBridge < Scene
  
  def enter()
    puts "You burst onto the Bridge with the neutron destruct bomb."
    puts "What do you do now?"
    print "> "
    
    action = $stdin.gets.chomp
    
    if action == "throw the bomb"
      puts "It goes off in your face!"
      return 'death'
    elsif action == "slowly place the bomb"
      puts "Good job - time to escape to the escape pod."
      return 'escape_pod'
    else
      puts "DOES NOT COMPUTE"
      return 'the_bridge'
    end
  end
end

class EscapePod < Scene
  
  def enter()
    puts "You rush into the escape pod"
    puts "oh no - there are 5 doors - one is the controller"
    puts "there is no time - you have to pick the right one"
    good_pod = rand(1..5)
    puts good_pod
    guess = $stdin.gets.chomp.to_i
    
    if guess != good_pod
      puts "the wrong pod"
      return 'death'
    else
      puts "whew - you picked the right one"
      puts "you won!"
      return 'finished'
    end
  end
end

class Finished < Scene
  
  def enter()
    puts "You won! Good job."
  end
end


class Map
  @@scenes = {
    'central_corridor' => CentralCorridor.new(),
    'laser_weapon_armory' => LaserWeaponArmory.new(),
    'the_bridge' => TheBridge.new(),
    'escape_pod' => EscapePod.new(),
    'death' => Death.new(),
  }
  
  def initialize(start_scene)
    @start_scene = start_scene
  end
  
  def next_scene(scene_name)
    val = @@scenes[scene_name]
    return val
  end
  
  def opening_scene()
    return next_scene(@start_scene)
  end
  
  attr_accessor :start_scene
  
end

a_map = Map.new('central_corridor')
a_game = Engine.new(a_map)
puts "play game"
a_game.play()

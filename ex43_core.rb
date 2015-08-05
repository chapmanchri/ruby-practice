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
    puts "You are in CentralCorridor"
    puts "you can shoot, dodge, joke*"
    print "> "
    action = $stdin.gets.chomp
    
    if action == "shoot"
      puts "shoot"
      return 'death'
      
    elsif action == "dodge"
      puts "dodge"
      return 'death'
      
     elsif action == "joke"
       puts "joke"
       # retruns the next room
       return 'laser_weapon_armory'
       
     else
       puts "DOES NOT COMPUTE!"
       return 'central_corridor'
     end
   end
 end


class LaserWeaponArmory < Scene
  
  def enter()
    puts "LaserWeaponArmory"
    code = "#{rand(1..9)}#{rand(1..9)}#{rand(1..9)}"
    puts "code = #{code}"
    print "[keypad]> "
    guess= $stdin.gets.chomp
    guesses = 0
    
    while guess != code && guesses < 3
      puts "BZZZZEDDD"
      guesses += 1
      print "[keypad]> "
      guess = $stdin.gets.chomp
    end
    
    if guess == code
      puts "correct"
      # returns the next room
      return 'the_bridge'
    else
      puts "did not guess correctly"
      return 'death'
    end
  end
end

class TheBridge < Scene
  
  def enter()
    puts "You burst onto the Bridge with the neutron destruct bomb."
    puts "throw, place*"
    print "> "
    
    action = $stdin.gets.chomp
    
    if action == "throw"
      puts "It goes off in your face!"
      return 'death'
    elsif action == "place"
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
    puts "good_pod is #{good_pod}"
    print "> "
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

class Soldier 
  include Motify

  def initialize
    on(:new_mission_started) {|location| puts "ready to go to #{location}!" }
    on(:new_commander_appointed) {|commander| puts "another boss..."}
  end

  def become_disillusioned
    forget :new_mission_started
  end
end

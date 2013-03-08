class Soldier 
  include Motify

  def initialize
    on(:new_mission_started) { puts "ready to go!" }
  end

  def become_disillusioned
    forget :new_mission_started
  end
end

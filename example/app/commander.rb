class Commander 
  include Motify
  extend Motify #If you want to send or receive events from class methods

  def order_mission 
    fire :new_mission_started, 'russia'
  end

  def self.promote(commander)
    fire :new_commander_appointed, commander
  end  
end

class Commander 
  include Motify

  def order_mission 
    fire :new_mission_started
  end
end

class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    soldier = Soldier.new
    commander = Commander.new
    p "Commander starting mission"
    commander.order_mission #should prompt soldier to state readiness
    
    Commander.promote(Commander.new) #should let soldier know of new commander

    soldier.become_disillusioned
    commander.order_mission #soldier will be silent
    true
  end
end

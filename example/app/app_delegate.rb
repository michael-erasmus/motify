class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    soldier = Soldier.new
    commander = Commander.new
    p "Commander starting mission"
    commander.order_mission #should prompt soldier to state readiness
    
    soldier.become_disillusioned
    commander.order_mission #soldier will be silent
    true
  end
end

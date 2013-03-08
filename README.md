Motify

A minimal DSL for doing notifications in RubyMotion (using NSNotificationCenter)
Just mix in the module to send or receive notifications 

```ruby
#handle notifications
class Soldier 
  include Motify

  def initialize
    on :new_mission_started do |location| 
      puts "ready to go to #{location}!"
    end
  end

  def become_disillusioned
    forget :new_mission_started
  end
end

#fire notifications
class Commander 
  include Motify

  def order_mission 
    fire :new_mission_started, 'russia'
  end
end
```

## Installation
Add it to your Gemfile:

`gem 'motify'`

Or install it manually:

`gem install motify`

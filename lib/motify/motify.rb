module Motify
  def observers
    @observers ||= {} 
  end

  def on(state,&block)
    observers[state] = add_observer(state,nil) do |notification|
      if block.arity == 0
        block.call
      else
        block.call notification.object
      end
    end
  end

  def fire(state, obj=nil)
    default_center.postNotificationName(state, object: obj, userInfo: obj)
  end
  
  def observes?(state)
    observers.keys.include? state  
  end

  def forget(state)
   default_center.removeObserver(observers.delete(state)) 
  end

  def forget_all
    observers.each_key{|state| forget(state)}
  end

  private
  def add_observer(state, object, &block)
    default_center.addObserverForName(state, object:nil, queue:main_queue, usingBlock:block)
  end

  def default_center
    NSNotificationCenter.defaultCenter
  end

  def main_queue
    NSOperationQueue.mainQueue
  end
end

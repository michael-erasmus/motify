module Notifia
  def observers
    @observers ||= {} 
  end

  def on(state,&block)
    observers[state] = add_observer(state,nil) do |obj|
      if block.arity == 0
        block.call
      else
        block.call obj
      end
    end
  end

  def fire(state)
    default_center.postNotificationName(state, object: nil, userInfo: nil) 
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

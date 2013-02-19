module Notifia

  def on(state,&block)
    add_observer(state,nil,&block)
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

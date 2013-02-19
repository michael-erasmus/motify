module Notifia
  def on(state,&block)
    NSNotificationCenter.defaultCenter.addObserverForName(state, object:nil, queue:NSOperationQueue.mainQueue, usingBlock:block)
  end
end

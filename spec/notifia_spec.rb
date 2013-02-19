describe "notifia" do
  before do
    @hn = HasNotifications.new
    @hn.extend Notifia
  end

  describe 'on' do
    it "exists" do
      @hn.should.respond_to :on
    end
    
    it 'observes notifications' do
      bla_observed = false
      @hn.on :bla {|object| bla_observed = true} 
      NSNotificationCenter.defaultCenter.postNotificationName(:bla, object:nil, userInfo:nil)
      bla_observed.should == true 
    end
  end
end


class HasNotifications
end

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
      observed = false
      @hn.on :bla {|object| observed = true} 
      NSNotificationCenter.defaultCenter.postNotificationName(:bla, object:nil, userInfo:nil)
      observed.should == true 
    end

    it 'fires notifications' do
      fired = false
      @hn.on :foo {|object| fired = true} 
      @hn.fire :foo
      fired.should == true
    end
  end
end


class HasNotifications
end

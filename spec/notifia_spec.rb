describe "notifia" do
  before do
    @hn = HasNotifications.new
    @hn.extend Notifia
  end

  it "has a 'on' method" do
    @hn.should.respond_to :on
  end
  
  it 'observes notifications' do
    @hn.on :bla {|object| observed = true} 
    @hn.should.observes :bla 
  end

  it 'fires notifications' do
    fired = false
    @hn.on :foo {|object| fired = true} 
    @hn.fire :foo
    fired.should == true
  end
end


class HasNotifications
end

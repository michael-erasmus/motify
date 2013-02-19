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
end


class HasNotifications
end

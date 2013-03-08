describe "motify" do
  before do
    @hn = HasNotifications.new
    @hn.extend Motify
  end
  
  describe 'on' do
    it 'observes notifications' do
      @hn.on :bla {|object| observed = true}
      @hn.should.observes :bla
    end

    it 'doesnt need to care about callback args' do
      @hn.on :yolo { puts :yolo }
      @hn.fire :yolo
      true.should == true #shouldnt raise error
    end
  end

  it 'fires notifications' do
    fired = false
    @hn.on :foo {|object| fired = true} 
    @hn.fire :foo
    fired.should == true
  end

  it 'fires notifications, passing in data' do
    passed = nil
    @hn.on :baz {|object| passed = object}
    @hn.fire :baz, "baz"
    passed.should == "baz"
  end

  it 'forgets notifications' do
    fired = false
    @hn.on :bar {|o| fired = true}
    @hn.forget :bar
    @hn.fire :bar
    @hn.should.not.observes :bar
    fired.should == false
  end

  it 'forgets all notifications' do
    @hn.on :foo {|o| }
    @hn.on :bar {|o| }

    @hn.forget_all

    @hn.should.not.observes :foo
    @hn.should.not.observes :bar
  end
end


class HasNotifications
end

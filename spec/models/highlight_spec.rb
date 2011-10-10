require 'spec_helper'

describe Highlight do

  before(:each) do
    @user = Factory(:user)
    @attr = { :content => "value for content" }
  end
  
  it "should create a new instance given valid attributes" do
    @user.highlights.create!(@attr)
  end
  
  describe "user associations" do
    
    before(:each) do
      @highlight = @user.highlights.create(@attr)
    end
    
    it "should have a user attribute" do
      @highlight.should respond_to(@user)
    end
    
    it "should have the right associated user" do
      @highlight.user_id.should == @user.id
      @highlight.user.should == @user
    end
  end  
  
  describe "validations" do
    
    it "should require a user id" do
      Highlight.new(@attr).should_not be_valid
    end
    
    it "should require nonblank content" do
      @user.highlights.build(:content => "  ").should_not be_valid
    end   
  end  
end

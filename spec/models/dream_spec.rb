require 'spec_helper'

describe Dream do

  before(:each) do
    @user = Factory.create(:user)
    @attr = { :content => "value for content" }
  end

  it "should create a new instance given valid attributes" do
    @user.dreams.create!(@attr)
  end
  
 describe "user associations" do

    before(:each) do
      @dream = @user.dreams.create(@attr)
    end

    it "should have a user attribute" do
      @dream.should respond_to(:user)
    end

    it "should have the right associated user" do
      @dream.user_id.should == @user.id
      @dream.user.should == @user
    end
  end  
  
  describe "validations" do

    it "should require a user id" do
      Dream.new(@attr).should_not be_valid
    end

    it "should require nonblank content" do
      @user.dreams.build(:content => "  ").should_not be_valid
    end
  end  
end

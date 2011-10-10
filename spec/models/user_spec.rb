require 'spec_helper'

describe User do
  
  describe "dream associations" do

    before(:each) do
      @user = Factory.create(:user)
      @d1 = Factory(:dream, :user => @user, :created_at => 1.day.ago)
      @d2 = Factory(:dream, :user => @user, :created_at => 1.hour.ago)
    end

    it "should have a dreams attribute" do
      @user.should respond_to(:dreams)
    end
    
    it "should destroy associated dreams" do
      @user.destroy
      [@d1, @d2].each do |dream|
        Dream.find_by_id(dream.id).should be_nil
      end
    end    
  end
  
  describe "highlight associations" do
    
    before(:each) do
      @user = User.create(@attr)
      @h1 = Factory(:highlight, :user => @user, :created_at => 1.day.ago)
      @h2 = Factory(:highlight, :user => @user, :created_at => 1.hour.ago)
    end
    
    it "should have a highlights attribute" do
      @user.should respond_to(:highlights)
    end
    
    it "should have the right highlights in the right order" do
      @user.highlights.should == [@h2, @h1]
    end  
    
    it "should destroy associated highlights" do
      @user.destroy
      [@h1, @h2].each do |highlight|
        Highlight.find_by_id(highlight.id).should be_nil
      end
    end
  end      
end

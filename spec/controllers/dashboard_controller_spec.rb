require 'spec_helper'

describe DashboardController do
  render_views
  
  describe "GET 'happiness'" do
    
    before(:each) do
      @user = Factory(:user)
    end
    
    it "should show the user's highlights" do
      h1 = Factory(:highlight, :user => @user, :content => "Foo bar")
      h2 = Factory(:highlight, :user => @user, :content => "Baz quux")
      get :happiness, :id => @user
      response.should have_selector("span.content", :content => h1.content)
      response.should have_selector("span.content", :content => h2.content)
    end 
  end
end    


    
    
require 'spec_helper'

describe HighlightsController do
  render_views
  
  describe "access control" do

    it "should deny access to 'create'" do
      post :create
      response.should redirect_to(new_user_session_path)
    end

    it "should deny access to 'destroy'" do
      delete :destroy, :id => 1
      response.should redirect_to(new_user_session_path)
    end
  end
  
  describe "POST 'create'" do
    
    before(:each) do
      @user = test_sign_in(Factory(:user))
    end  
    
    describe "failure" do
      
      before(:each) do
        @attr = { :content => "" }
      end
    
      it "should not create a highlight" do
        lambda do
          post :create, :highlight => @attr
        end.should_not change(Highlight, :count)
      end
      
      it "should render the highlights page" do
        post :create, :highlight => @attr
        response.should render_template('/happiness')  
      end
    end
    
    describe "success" do

      before(:each) do
        @attr = { :content => "Lorem ipsum" }
      end

      it "should create a highlight" do
        lambda do
          post :create, :highlight => @attr
        end.should change(Highlight, :count).by(1)
      end

      it "should redirect to the hapiness" do
        post :create, :highlight => @attr
        response.should redirect_to('/happiness')
      end

      it "should have a flash message" do
        post :create, :highlight => @attr
        flash[:success].should =~ /highlight created/i
      end
    end   
  end   
end

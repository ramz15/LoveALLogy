class DashboardController < ApplicationController

  def home
    @title = "LoveALLogy"
    @user = current_user
    if user_signed_in?
      @dream = Dream.new
      # @feed_items = current_user.feed.paginate(:page => params[:page]) 
    end
  end
  
  def dreams
    @title = "Dreams"
    @user = current_user
    @dream = Dream.new(:user_id => @user.id)
    #if user_signed_in?
    #  @dream = Dream.new(:user_id => @user.id)
    #end 
    #@users = User.paginate(:page => params[:page]) 
  end

  def happiness
    @title = "Happiness"
    @user = current_user
    
  end

  def change
    @title = "Change the World"   
    @user = current_user
     
  end

end

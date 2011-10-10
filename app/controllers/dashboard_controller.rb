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
    if user_signed_in?
      @title = "Dreams"
      @user = current_user
      @dream = Dream.new(:user_id => @user.id)
      #@users = User.paginate(:page => params[:page]) 
    else
      redirect_to new_user_session_path
    end    
  end

  def happiness
    if user_signed_in?    
      @title = "Happiness"
      @user = User.find(current_user.id)
      @highlight = Highlight.new if user_signed_in?
      @highlights = @user.highlights.paginate(:page => params[:page])
    else
      redirect_to new_user_session_path
    end      
  end

  def change
    if user_signed_in?    
      @title = "Change the World"   
      @user = current_user
    else
      redirect_to new_user_session_path
    end
  end
  
  def links
    if user_signed_in?    
      @title = "Links"   
      @user = current_user
    else
      redirect_to new_user_session_path
    end
  end
end

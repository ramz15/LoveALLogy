class DashboardController < ApplicationController

  def home
    @title = "LoveALLogy"
    if user_signed_in?
      @dream = Dream.new
      # @feed_items = current_user.feed.paginate(:page => params[:page]) 
    end
  end
  
  def dreams
    @title = "Dreams"
    if user_signed_in?
      @dream = Dream.new
    end  
  end

  def happiness
    @title = "Happiness"
  end

  def change
    @title = "Change the World"    
  end

end

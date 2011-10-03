class DreamsController < ApplicationController
  before_filter :authenticate, :only => [:create, :destroy]
  before_filter :authorized_user, :only => :destroy
  
  def create
    @dream = current_user.dreams.build(params[:dream])
    if @dream.save
      flash[:success] = "Dream created!"
      redirect_to root_path
    else
      @feed_items = []
      render 'pages/home'
    end
  end

  def destroy
    @dream.destroy
    redirect_back_or root_path    
  end
  
  private

    def authorized_user
      @dream = current_user.dreams.find_by_id(params[:id])
      redirect_to root_path if @dream.nil?
    end
      
end

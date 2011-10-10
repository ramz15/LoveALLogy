class DreamsController < ApplicationController
  #before_filter :authenticate, :only => [:create, :destroy]
  #before_filter :authorized_user, :only => :destroy
  
  def create
    @dream = current_user.dreams.build(params[:dream])
    if @dream.save
      flash[:success] = "Dream created!"
      respond_to do |format|
        format.html { redirect_to '/dreams'}
        format.js
      end  
      #redirect_to '/dreams'
    else
      @feed_items = []
      render '/dreams'
    end
  end

  def destroy
    @dream.destroy
    redirect_back_or root_path    
  end
  
  def vote_up
    @user = current_user
    @dream = Dream.find(current_user.id)
    #begin
    unless @user.voted_for?(@dream)
      @user.vote_for(@dream)
      redirect_to '/dreams'
    else
      redirect_to '/dreams'
    end    
    #  render :nothing => true, :status => 200
    #rescue ActiveRecord::RecordInvalid
    #  render :nothing => true, :status => 404
    #end
  end  
  
  def vote_down
    @user = current_user
    @dream = Dream.find(current_user.id)
    unless @user.voted_against?(@dream)
      @user.vote_against(@dream)
      redirect_to '/dreams'
    else
      redirect_to '/dreams'
    end
    #begin
    #  render :nothing => true, :status => 200
    #rescue ActiveRecord::RecordInvalid
    #  render :nothing => true, :status => 404
    #end
  end
  
  def show
    @dream = Dream.find(current_user.id)

    respond_to do |format|
      format.html  # show.html.erb
      format.json  { render :json => @dream }
    end
  end
  
  def update
    @dream = Dream.find(current_user.id)

    respond_to do |format|
      if @dream.update_attributes(params[:dream])
        format.html  { redirect_to(@dream,
                      :notice => 'Post was successfully updated.') }
        format.json  { render :json => {}, :status => :ok }
      else
        format.html  { render :action => "edit" }
        format.json  { render :json => @dream.errors,
                      :status => :unprocessable_entity }
      end
    end
  end
  
  
  private

    def authorized_user
      @dream = current_user.dreams.find_by_id(params[:id])
      redirect_to root_path if @dream.nil?
    end
      
end

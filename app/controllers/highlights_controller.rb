class HighlightsController < ApplicationController
  before_filter :authenticate_user!
  
  def create
    @highlight = current_user.highlights.build(params[:highlight])
    if @highlight.save
      flash[:success] = "Highlight created!"
      redirect_to '/happiness'
    else
      render '/dreams'
    end    
  end

  def destroy
  end
end

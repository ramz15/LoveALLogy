module ApplicationHelper
  def logo
    image_tag("loveallogyMuseoM.png", :alt => "LoveALLogy", :class => "round")
  end
  
  def brain
    image_tag("bright_blue_brain.jpg", :alt => "My Brain", :class => "brain")
  end
  
  def up_vote
    image_tag("arrow_up.png", :alt => "up vote", :class => "up_vote", :size => '20x20')
  end
  
  def down_vote
    image_tag("blue_arrow_down.png", :alt => "down vote", :class => "down_vote", :size => '20x20')
  end
  
  def authenticate
    deny_access unless user_signed_in?
  end

  def deny_access
    store_location
    redirect_to new_user_session_path, :notice => "Please sign in to access this page."
  end
  
  
  # Return a title on a per-page basis.
  def title
    base_title = "LoveALLogy"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
end

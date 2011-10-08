module ApplicationHelper
  def logo
    image_tag("loveallogyMuseoM.png", :alt => "LoveALLogy", :class => "round")
  end
  
  def brain
    image_tag("bright_blue_brain.jpg", :alt => "My Brain", :class => "brain")
  end
  
  def up_vote
    image_tag("arrow_up.png", :alt => "up vote", :class => "up_vote")
  end
  
  def down_vote
    image_tag("blue_arrow_down.png", :alt => "down vote", :class => "down_vote")
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

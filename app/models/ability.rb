class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    user ||= User.new # guest user (not logged in)
      if user.admin?
        can :manage, :all
      else
        can :read, :all
    end
    
    # Dream management: Allow experts in particular fields to moderate and add resources to Dream categories. 
    #
    # if user.role? :moderator
    #   can :manage, Dream
    # end
    #
     
    # Admin role:
    #
    # if user.role? :admin
    #   can :manage, :all
    # end
    #
     
    # Banned role:
    #
    # if user.role? :banned
    #  cannot :read, :all
    #  cannot :manage, :all
    # end
    
    # Pro Users: Allow Pro users to access all resources, videos and actions.
    #
    # if user.role? :pro
    #  can :read, :all
    # end
    #
    
    # Premium Users: Allow Premium users to access all of Pro, plus Dream achievement tools
    #
    # if user.role? :premium
    #  can :read, :all
    #  can :manage, Dream_tools
    # end
    #
  
    #
    # The first argument to `can` is the action you are giving the user permission to do.
    # If you pass :manage it will apply to every action. Other common actions here are
    # :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. If you pass
    # :all it will apply to every resource. Otherwise pass a Ruby class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end

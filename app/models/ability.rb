class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user
    if user.role == 'admin'
      can :manage, :all
    else
      can :read, Post # All users can read posts
      can :create, Post if user.persisted? # Logged-in users can create posts
      can :update, Post, author_id: user.id # Users can update their own posts
      can :destroy, Post, author_id: user.id # Users can delete their own posts

      can :create, Comment if user.persisted? # Logged-in users can create comments
      can :destroy, Comment, author_id: user.id # Users can delete their own comments
    end
  end
end

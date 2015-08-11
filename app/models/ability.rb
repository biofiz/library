class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    can :manage, :all if user.admin?

    # Don't forget to add ability for update and edit only for usual, demo, native
    can :manage, Book if user.librarian?
    can :manage, Comment if user.librarian?

    if user.native?
      can [:manage], [Book, Comment], user_id: user.id
    end

    if user.usual?
      # Don't forget to add ability for update and delete only for pending books
      can [:manage], [Book, Comment], user_id: user.id
    end

    if user.demo?
      can :manage, Comment, user_id: user.id
    end
    can :read, [Book, Comment]


  end
end

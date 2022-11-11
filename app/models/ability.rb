class Ability
  include CanCan::Ability
  def initialize(author)
    return unless author.present?
    can :read, Post
    can :create, Comment
    can :destroy, Comment, author_id: author.id
    can :manage, Post, author_id: author.id

    return unless author.admin?
    can :manage, :all
  end
end
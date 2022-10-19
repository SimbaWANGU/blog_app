class Post < ApplicationRecord
  has_many :comments
  belongs_to :author
  has_many :likes
  after_save :update_post_counter

  def recent_comments
    Comment.limit(5).order(created_at: :desc).where(post: self)
  end

  private

  def update_post_counter
    author.increment!(:posts_counter)
  end
end

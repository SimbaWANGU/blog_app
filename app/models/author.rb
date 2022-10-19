class Author < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :likes

  def most_recent_posts
    Post.limit(3).order(created_at: :desc).where(author: self)
  end
end

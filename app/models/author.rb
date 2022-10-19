class Author < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :posts, through: :likes
end

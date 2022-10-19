class Post < ApplicationRecord
  has_many :comments
  belongs_to :author
  has_many :authors, through: :likes
end

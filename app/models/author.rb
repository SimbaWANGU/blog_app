class Author < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :posts
  has_many :comments
  has_many :likes
  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def is?(requested_role)
    role == requested_role.to_s
  end

  def admin?
    is? :admin
  end

  def most_recent_posts
    Post.limit(3).order(created_at: :desc).where(author: self)
  end
end

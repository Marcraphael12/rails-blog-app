class User < ApplicationRecord
  has_many :posts, foreign_key: :author_id
  has_many :likes, foreign_key: :user_id
  has_many :coments, foreign_key: :user_id

  validates :name, presence: true
  validates :photo, presence: true
  validates :bio, presence: true
  validates :post_counter, presence: true

  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end

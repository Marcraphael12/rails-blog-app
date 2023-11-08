class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  after_save :increment_user_posts_count

  def all_comments
    comments.all
  end

  def recent_comments
    comments.includes(:author).order(created_at: :desc).limit(5)
  end

  def increment_user_posts_count
    author.increment!(:posts_counter)
  end
end

class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :likes
  has_many :coments

  validates :title, presence: true
  validates :text, presence: true
  validates :comments_counter, presence: true
  validates :likes_counter, presence: true

  after_create :increase_posts_counter

  def recent_comments
    coments.order(created_at: :desc).limit(5)
  end

  def increase_posts_counter
    author.increment(:posts_counter).save
  end
end

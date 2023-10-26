class Comment < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: :user_id
  belongs_to :post, class_name: 'Post', foreign_key: :post_id

  validates :author_id, presence: true
  validates :post_id, presence: true
  after_create :increase_comments_counter

  def increase_comments_counter
    post.increment(:comments_counter).save
  end
end

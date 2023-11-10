class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  belongs_to :post, class_name: 'Post', foreign_key: :post_id

  after_create :update_comments_counter
  before_destroy :decrease_comments_counter

  def update_comments_counter
    post.increment(:comments_counter).save
  end

  def decrease_comments_counter
    post.decrement(:comments_counter).save
  end
end

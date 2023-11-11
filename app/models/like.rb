class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post, class_name: 'Post'

  after_create :update_likes_counter
  after_destroy :update_likes_counter

  private

  def update_likes_counter
    post.increment(:likes_counter).save
  end
end

class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  # defining callbacks in the `Comment` model.
  after_create :update_comments_counter
  after_destroy :update_comments_counter
  def update_comments_counter
    # updating the `CommentsCounter` attribute
    # of the associated `post` object with the count of comments that belong to that post. It is using
    # the `update` method provided by ActiveRecord to update the attribute value.
    post.update(comments_counter: post.comments.count)
  end
end

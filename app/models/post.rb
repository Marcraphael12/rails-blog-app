class Post < ApplicationRecord
  # defining an association between the `Post`
  # model and the `User` model. It indicates that a `Post` belongs to an `Author`, and the `Author` is
  # an instance of the `User` model.
  belongs_to :author, class_name: 'User'

  # defining associations between the `Post`
  # model and the `Comment` and `Like` models, respectively.
  has_many :comments, foreign_key: 'post_id'
  has_many :likes, foreign_key: 'post_id'

  # These lines of code are defining validations for the `Post` model.
  validates :title, presence: true, length: { maximum: 250 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_save :update_user_posts_counter

  def recent_comments
    # List the five last comment on a post
    Comment.where(post_id: id).order('created_at DESC').limit(5)
  end

  def update_user_posts_counter
    # updating the `posts_counter` attribute of
    # the associated `author` object with the count of the `posts` associated with that `author`.
    author.update(post_counter: author.posts.count)

    # `author.increment!(:posts_counter)` is incrementing the value of the `posts_counter` attribute
    # of the associated `author` object by 1.
    # author.increment!(:PostCounter)
  end
end

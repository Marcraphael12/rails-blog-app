class Post < ApplicationRecord
  # # defining an association between the `Post`
  # # model and the `User` model. It indicates that a `Post` belongs to an `Author`, and the `Author` is
  # # an instance of the `User` model.
  # belongs_to :author, class_name: 'User', dependent: :destroy

  # # defining associations between the `Post`
  # # model and the `Comment` and `Like` models, respectively.
  # has_many :comments, foreign_key: 'post_id', dependent: :destroy
  # has_many :likes, foreign_key: 'post_id', dependent: :destroy

  # # These lines of code are defining validations for the `Post` model.
  # validates :title, presence: true, length: { maximum: 250 }
  # validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0, allow_nil: true }
  # validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0, allow_nil: true }

  # after_save :update_user_posts_counter

  # def recent_comments
  #   # List the five last comment on a post
  #   Comment.where(post_id: id).order('created_at DESC').limit(5)
  # end

  # def update_user_posts_counter
  #   # updating the `posts_counter` attribute of
  #   # the associated `author` object with the count of the `posts` associated with that `author`.
  #   author.update(post_counter: author.posts.count)

  #   # `author.increment!(:posts_counter)` is incrementing the value of the `posts_counter` attribute
  #   # of the associated `author` object by 1.
  #   # author.increment!(:PostCounter)
  # end

  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :likes, foreign_key: :post_id, dependent: :destroy
  has_many :comments, foreign_key: :post_id, dependent: :destroy

  validates :title, presence: true, length: { maximum: 250 }
  validates :text, presence: true
  after_create :increment_post_counter
  before_destroy :decrement_post_counter

  before_destroy :delete_associated_comments_and_likes

  def delete_associated_comments_and_likes
    comments.destroy_all
    likes.destroy_all
  end

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  def increment_post_counter
    author.increment!(:post_counter)
  end

  def decrement_post_counter
    author&.decrement!(:post_counter)
  end
end

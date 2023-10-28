require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'comments_counter of post should update' do
    author = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher.', post_counter: 0)
    post = Post.new(author:, title: 'Hello', text: 'This is my first post', comments_counter: 0, likes_counter: 0)
    comment = Comment.new(user: author, post:)
    author.save
    post.save
    comment.save
    expect(post.comments_counter).to eq(1)
  end
end

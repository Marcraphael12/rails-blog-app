require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', post_counter: 0) }

  before { subject.save }
  it 'name should be present' do
    subject.name = 'Tom'
    expect(subject).to be_valid
  end

  it 'user posts should not be negative' do
    subject.post_counter = -1
    expect(subject).to_not be_valid
  end

  it 'zero (0) should be allowed' do
    subject.post_counter = 0
    expect(subject).to be_valid
  end

  it 'post_counter is not a numerical value' do
    subject.post_counter = 'not_numeric'
    subject.save
    expect(subject).to_not be_an_instance_of(Numeric)
  end

  it 'posts_counter of author should update' do
    post = Post.new(author: subject, title: 'Hello', text: 'first post', likes_counter: 0, comments_counter: 0)
    post.save
    subject.save
    expect(subject.post_counter).to eq(1)
  end

  it 'recent posts should return the last 3' do
    first_post = Post.new(author: subject, title: 'Hello', text: 'first post', likes_counter: 0, comments_counter: 0)
    second_post = Post.new(author: subject, title: 'Hello', text: 'second post', likes_counter: 0, comments_counter: 0)
    third_post = Post.new(author: subject, title: 'Hello', text: 'tirth post', likes_counter: 0, comments_counter: 0)
    fourth_post = Post.new(author: subject, title: 'Hello', text: 'fourth post', likes_counter: 0, comments_counter: 0)
    subject.save
    first_post.save
    second_post.save
    third_post.save
    fourth_post.save

    expect(subject.recent_posts).to eq([fourth_post, third_post, second_post])
  end
end

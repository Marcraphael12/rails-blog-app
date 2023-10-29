require 'rails_helper'

RSpec.describe Post, type: :model do
  # default values
  author = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                    post_counter: 0)
  subject { Post.new(author:, title: 'Hello', text: 'This is my first post', likes_counter: 0, comments_counter: 0) }
  it 'title must be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'title must be less than 250 chars' do
    subject.title = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec luctus neque quis nulla facilisis
    consequat. Nulla urna enim, lacinia quis odio at, venenatis tempus ante. lectus lobortis. Donec auctor
    efficitur justo vitae iaculis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos
    lectus lobortis. Donec auctor efficitur justo vitae iaculis'
    expect(subject).to_not be_valid
  end

  it 'user likes should not be negative' do
    subject.likes_counter = -1
    expect(subject).to_not be_valid
  end

  it 'zero value should be allowed' do
    subject.likes_counter = 0
    expect(subject).to be_valid
  end

  it 'user comments should not be negative' do
    subject.comments_counter = -1
    expect(subject).to_not be_valid
  end

  it 'recent comments should return the last 5' do
    user = User.new(name: 'Tom', photo: 'https://photos/F_-0BxGuVvo', bio: 'Teacher', post_counter: 0)
    user.save
    subject.save
    first_comment = Comment.new(post: subject, user:, text: 'Hi Tom!')
    second_comment = Comment.new(post: subject, user:, text: 'Hi Tom!')
    third_comment = Comment.new(post: subject, user:, text: 'Hi Tom!')
    fourth_comment = Comment.new(post: subject, user:, text: 'Hi Tom!')
    fifth_comment = Comment.new(post: subject, user:, text: 'Hi Tom!')
    sixth_comment = Comment.new(post: subject, user:, text: 'Hi Tom!')
    first_comment.save
    second_comment.save
    third_comment.save
    fourth_comment.save
    fifth_comment.save
    sixth_comment.save
    expect(subject.recent_comments).to eq([sixth_comment, fifth_comment, fourth_comment, third_comment, second_comment])
  end

  it 'zero (0) should be allowed' do
    subject.comments_counter = 0
    expect(subject).to be_valid
  end

  it 'posts_counter of author should update' do
    author = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher.', post_counter: 0)
    post = Post.new(author:, title: 'Hello', text: 'This is my first post', comments_counter: 0, likes_counter: 0)
    author.save
    post.save
    expect(author.post_counter).to eq(1)
  end
end

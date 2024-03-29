require 'rails_helper'
RSpec.describe 'Renders the post show page', type: :feature do
  before :each do
    @user = User.create(name: 'Marc', photo: 'https://media.gettyimages.com/id/1278139568/nl/foto/studioportret-van-20-jaar-oude-vrouw.jpg?s=612x612&w=0&k=20&c=3Bd4Ot79Z1ZKoCwAl0qFQ9hoBrQTar4SqtPefHOBEkg=',
                        bio: 'Teacher from Brazil.', posts_counter: 5)

    @first_post = Post.create(title: 'Hello there', text: 'This is my first post',
                              comments_counter: 0, likes_counter: 0, author_id: @user.id)
    Comment.create(text: 'Hi Marc!', author_id: @user.id, post_id: @first_post.id)
    Comment.create(text: 'How are you?', author_id: @user.id, post_id: @first_post.id)
    Comment.create(text: 'Awesome Bro', author_id: @user.id, post_id: @first_post.id)

    @first_post.update(comments_counter: @first_post.comments.count)
    visit user_posts_path(@first_post.author, @first_post)
  end

  scenario 'displays the post title' do
    visit user_posts_path(@first_post.author, @first_post)
    expect(page).to have_content(@first_post.author.name)
  end

  scenario 'check if you can see who wrote the post' do
    visit user_post_path(@user, @first_post) # final requirement
    expect(page).to have_content(@first_post.author.name)
  end

  scenario 'displays number of comments' do
    visit user_posts_path(@first_post.author, @first_post)
    expect(page).to have_content(/comments: 3/i)
  end

  scenario 'displays number of likes' do
    visit user_posts_path(@first_post.author, @first_post)
    expect(page).to have_content("Likes: #{@first_post.likes_counter}")
  end

  scenario 'displays comments' do
    visit user_posts_path(@first_post.author, @first_post)
    expect(page).to have_content('Hi Marc!')
  end

  scenario 'displays the username of each commentor' do
    expect(page).to have_content(@user.name)
    @first_post.comments.each do |comment|
      expect(page).to have_content(comment.author.name)
    end
  end

  scenario 'displays the comments left by each commentor' do
    @first_post.comments.each do |comment|
      expect(page).to have_content(comment.text)
    end
  end
end

require 'rails_helper'

describe 'Post index page', type: :feature do
  before :each do
    @user = User.create(name: 'Marc', photo: 'Marc.jpg', bio: 'The One')
    @post = Post.create(author: @user, title: 'Awakening', text: 'I choose the red pill')
    @post_two = Post.create(author: @user, title: 'Training', text: 'I know kung fu')
    @post_three = Post.create(author: @user, title: 'The Oracle', text: 'There is no spoon')
    @post_four = Post.create(author: @user, title: 'Choice', text: 'I believe I can save Morpheus')
    @post_five = Post.create(author: @user, title: 'Agent encounter', text: 'still only human')
    @comment = Comment.create(post_id: @post, author_id: @user, text: 'time to fight')
    @comment_two = Comment.create(post_id: @post_two, author_id: @user, text: 'time to fight')
    visit user_posts_path(@user)
  end

  # shows the user profile picture
  it 'shows the user profile picture' do
    expect(page).to have_css("img[src='#{@user.photo}']")
  end

  it 'shows the username of the user' do
    expect(page).to have_content(@user.name)
  end

  it 'shows the number of posts for the user' do
    expect(page).to have_content(@user.posts_counter)
  end

end

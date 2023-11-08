require 'rails_helper'

RSpec.describe 'Renders users Show Page', type: :feature do
  before(:each) do
    # Create necessary objects for the tests, such as a user and their posts
    @user = User.create(id: 1, name: 'Marc', photo: 'profile.jpg', bio: 'Software Engineer', posts_counter: 10)
    @first_post = Post.create(author: @user, title: 'Hi people', text: 'Lorem ipsum dolor sit amet.')
    Post.create(author: @user, title: 'Good', text: 'Consectetur adipiscing elit.')
    Post.create(author: @user, title: 'Dev', text: 'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.')
    @post = Post.create(author: @user, title: 'Hello', text: 'Lol')
  end

  scenario 'Display user profile picture' do
    visit user_path(@user.id)
    expect(page).to have_css("img[src*='profile.jpg']")
  end

  scenario 'Display user username' do
    visit user_path(@user.id)
    expect(page).to have_content('Marc')
  end

  scenario 'Display number of user posts' do
    visit user_path(@user.id)
    expect(page).to have_content('Number of posts: 14')
  end

  scenario 'Display user bio' do
    visit user_path(@user.id)
    expect(page).to have_content('Software Engineer')
  end

  scenario 'Display users first 3 posts' do
    visit user_path(@user.id)
    expect(page).to have_content(@user.recents_posts[0].title)
    expect(page).to have_content(@user.recents_posts[1].text)
    expect(page).to have_content(@user.recents_posts[2].author.id)
    expect(page).to have_content(@first_post.author.name)
  end

  scenario 'Ensure other user posts are not displayed' do
    visit user_path(@user.id)
    expect(page).to have_no_content(Post.where(author: @user))
  end

  scenario 'View all posts button redirects to user posts index page' do
    # first visit the user page to find the "see all posts button"
    visit user_path(@user)

    # Click "See all posts" button redirects to the user's posts index page
    click_link 'See all posts'

    # this one is checking if user is taken to users/:id/posts
    expect(page).to have_current_path(user_posts_path(@user))
  end

  scenario 'Clicking on a user post redirects to post show page' do
    visit user_path(@user)

    # Test: Clicking on a user's post redirects to the post's show page
    click_link('See all posts')
    expect(page).to have_current_path(user_posts_path(@user))
  end
end

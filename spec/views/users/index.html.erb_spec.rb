require 'rails_helper'

RSpec.feature 'User Index Page', type: :feature do
  before :each do
    @user = User.create(id: 1, name: 'Marc', photo: 'https://media.gettyimages.com/id/1278139568/', bio: 'Tech',
                        posts_counter: 5)
  end

  scenario 'Creating Users' do
    @user1 = User.create(name: 'Lilly', photo: 'user1.jpg', bio: 'teacher', posts_counter: 1)
    @user2 = User.create(name: 'user2', photo: 'user2.jpg', bio: 'farmer', posts_counter: 2)
  end

  scenario 'Visiting Users Path and Displaying Usernames and Profile Pictures' do
    visit users_path

    # Test: Display username of all other users
    expect(page).to have_content(@user.name)

    # Test: Display profile picture for each user
    expect(page).to have_css("img[src*='https://media.gettyimages.com/id/1278139568/']")
  end

  scenario 'Testing Number of Posts Display' do
    visit users_path

    # Test: Display number of posts each user has written
    expect(page).to have_content('Number of posts: 5')
  end

  scenario 'renders the user show page' do
    visit '/'
    click_link(@user.name, match: :first)
    expect(page).to have_content(@user.name)
    expect(page).to have_current_path(user_path(@user))
  end
end

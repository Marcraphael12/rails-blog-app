require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  let(:user) do
    User.create(
      name: 'Marc',
      photo: 'http://www.image.com',
      bio: 'Developer',
      post_counter: 5
    )
  end

  let!(:post) do
    Post.create(
      title: 'Ruby',
      text: 'Learn ruby',
      author_id: user,
      comments_counter: 5,
      likes_counter: 10
    )
  end

  describe 'GET /index' do
    before do
      get "/users/#{user.id}/posts/"
    end

    it 'renders post template' do
      expect(response).to render_template(:index)
    end

    it 'post response body includes correct placeholder text' do
      expect(response.body).to include('List of all posts')
    end
  end

  describe 'GET /show' do
    before do
      get '/users/10/posts/10'
    end

    it 'returns success for detail post' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders post detail template' do
      expect(response).to render_template(:show)
    end

    it 'post detail response body includes correct placeholder text' do
      expect(response.body).to include('Hey i am a post')
    end
  end
end

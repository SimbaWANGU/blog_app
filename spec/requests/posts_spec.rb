require 'rails_helper'

RSpec.describe 'Author Posts', type: :request do
  describe 'GET /index' do
    @author = Author.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                         posts_counter: 0)
    @post = Post.create(author: @author, title: 'Hello', text: 'This is my first post', likes_counter: 0,
                        comments_counter: 0)
    @author.save
    @post.save
    id = @author.id
    before(:example) { get author_posts_url(id) }
    it 'responds with code 200' do
      expect(response).to have_http_status(200)
    end

    it 'renders authors list view' do
      expect(response).to render_template(:index)
    end

    it 'shows correct content in the view' do
      expect(response.body).to include('list of all posts for a given user')
    end
  end

  describe 'GET /show' do
    @author = Author.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                         posts_counter: 0)
    @post = Post.create(author: @author, title: 'Hello', text: 'This is my first post', likes_counter: 0,
                        comments_counter: 0)
    @author.save
    @post.save
    id = @author.id
    post_id = @post.id
    before(:example) { get author_post_url(id, post_id) }
    it 'responds with code 200' do
      expect(response).to have_http_status(200)
    end

    it 'renders authors list view' do
      expect(response).to render_template(:show)
    end

    it 'shows correct content in the view' do
      expect(response.body).to include('Here is a post for a given user based on post_id')
    end
  end
end

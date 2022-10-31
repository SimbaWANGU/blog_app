require 'rails_helper'

RSpec.describe 'Authors', type: :request do
  describe 'GET /index' do
    before(:example) { get authors_path }
    it 'responds with code 200' do
      expect(response).to have_http_status(200)
    end

    it 'renders authors list view' do
      expect(response).to render_template(:index)
    end

    it 'shows correct content in the view' do
      expect(response.body).to include('Here is a list of all authors')
    end
  end

  describe 'GET /show' do
    @author = Author.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                         posts_counter: 0)
    @author.save
    id = @author.id
    before(:example) { get author_path(id) }
    it 'responds with code 200' do
      expect(response).to have_http_status(200)
    end

    it 'renders authors list view' do
      expect(response).to render_template(:show)
    end

    it 'shows correct content in the view' do
      expect(response.body).to include('Here is a list of user based on author_id')
    end
  end
end

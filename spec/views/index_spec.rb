require 'rails_helper'

RSpec.describe 'Author index page', type: :feature do
  describe 'test for author index' do
    @author = Author.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                         posts_counter: 0)
    @post = Post.create(author: @author, title: 'Hello', text: 'This is my first post', likes_counter: 0,
                        comments_counter: 0)
    @comment = Comment.create(author: @author, post: @post, text: 'My comment')
    @like = Like.create(author: @author, post: @post)
    @author.save
    @post.save
    @comment.save
    @like.save

    scenario ' I can see the username of all authors.' do
      visit '/'
      expect(page).to have_content('Tom')
    end
    scenario 'I can see the profile picture for each user.' do
      visit '/'
      page.has_selector?('img')
    end

    scenario 'I can see the number of posts ' do
      visit '/'
      expect(page).to have_content('Number of posts:')
    end

    scenario 'When I click on an author, I am redirected to that authors show page.' do
      visit '/'
      first('.author_link').click
      expect(page).to have_content('See All Posts')
    end
  end
end

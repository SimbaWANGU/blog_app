# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
first_user = Author.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
second_user = Author.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')

first_post = Post.create(author: first_user, title: 'Hello', text: 'This is my first post')
second_post = Post.create(author: first_user, title: 'Hello', text: 'This is my first post')
third_post = Post.create(author: first_user, title: 'Hello', text: 'This is my first post')
fourth_post = Post.create(author: first_user, title: 'Hello', text: 'This is my first post')

Comment.create(post: first_post, author: second_user, text: 'Hi Tom!' )
Comment.create(post: first_post, author: first_user, text: 'Hi Lilly!' )
Comment.create(post: first_post, author: second_user, text: 'How are you?' )
Comment.create(post: first_post, author: first_user, text: 'I\'m fine, what about you?' )
Comment.create(post: first_post, author: second_user, text: 'I\'m doing great!' )
Comment.create(post: first_post, author: first_user, text: 'Awesome!' )

Like.create(post: first_post, author: first_user)
Like.create(post: first_post, author: second_user)
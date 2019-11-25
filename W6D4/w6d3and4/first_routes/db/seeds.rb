# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ActiveRecord::Base.transaction do
  User.destroy_all
  user1 = User.create!(username: 'Jason_V')
  user2 = User.create!(username: 'Freddy_K')
  user3 = User.create!(username: 'Michael_M')
  user4 = User.create!(username: 'Ghostface')

  Artwork.destroy_all
  art1 = Artwork.create!(title: 'The 13th', image_url: 'Friday.com', artist_id: user1.id)
  art2 = Artwork.create!(title: 'Elm Street', image_url: 'Nightmare.com', artist_id: user2.id)
  art3 = Artwork.create!(title: 'Trick or Treat', image_url: 'Halloween.com', artist_id: user3.id)
  art4 = Artwork.create!(title: 'Dont Scream', image_url: 'Scream.com', artist_id: user4.id)

  ArtworkShare.destroy_all
  ArtworkShare.create(artwork_id: art4.id, viewer_id: user1.id)
  ArtworkShare.create(artwork_id: art3.id, viewer_id: user2.id)
  ArtworkShare.create(artwork_id: art2.id, viewer_id: user3.id)
  ArtworkShare.create(artwork_id: art1.id, viewer_id: user4.id)

  Comment.destroy_all
  comment_1 = Comment.create!(artwork_id: art4.id, user_id: user1.id, body: "This is gahbage.")
  comment_2 = Comment.create!(artwork_id: art3.id, user_id: user2.id, body: "This is great.")
  comment_3 = Comment.create!(artwork_id: art2.id, user_id: user3.id, body: "This is gahbage and great.")
  comment_4 = Comment.create!(artwork_id: art1.id, user_id: user4.id, body: "This is mediocre.")

  Like.destroy_all
  Like.create!(user_id: user1.id, likeable_id: art1.id, likeable_type: 'Artwork')
  Like.create!(user_id: user2.id, likeable_id: art2.id, likeable_type: 'Artwork')
  Like.create!(user_id: user3.id, likeable_id: comment_3.id, likeable_type: 'Comment')
  Like.create!(user_id: user4.id, likeable_id: comment_4.id, likeable_type: 'Comment')
end
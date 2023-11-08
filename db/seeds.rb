# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)



10.times do |n|
  User.create(
    name: "User #{(n) + 1}",
    photo: "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8dXNlciUyMGljb24lMjBwaWN0dXJlfGVufDB8fDB8fHww&auto=format&fit=crop&w=800&q=60",
    bio: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Commodi quaerat eum enim suscipit est repellendus, et natus vel praesentium excepturi quisquam saepe eos impedit ducimus nesciunt exercitationem. Vel, eius praesentium! #{(n) + 1}"
  )
end


30.times do
  random_user = User.all.sample
  Post.create(
    title: "Title of the post",
    text: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Commodi quaerat eum enim suscipit est repellendus, et natus vel praesentium excepturi quisquam saepe eos impedit ducimus nesciunt exercitationem. Vel, eius praesentium!",
    author_id: random_user.id
  )
end

30.times do
  random_user = User.all.sample
  random_post = Post.all.sample
  Comment.create(
    author_id: random_user.id,
    post_id: random_post.id,
    text: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Commodi quaerat eum enim suscipit est repellendus, et natus vel praesentium excepturi quisquam saepe eos impedit ducimus nesciunt exercitationem. Vel, eius praesentium! Lorem ipsum dolor sit amet consectetur adipisicing elit. Commodi quaerat eum enim suscipit est repellendus, et natus vel praesentium excepturi quisquam saepe eos impedit ducimus nesciunt exercitationem. Vel, eius praesentium! '#{random_post.title}'"
  )
end


30.times do
  random_user = User.all.sample
  random_post = Post.all.sample
  Like.create(
    author_id: random_user.id,
    post_id: random_post.id
  )
end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
num_users = 10
puts 'creando usuarios'
num_users.times do |i|
  User.create(
    name: 'User #{i + 1}',
    photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
    bio: 'Bio #{i + 1}',
    post_counter: 0    
  )
  puts 'ususario creado exitosamente'
end

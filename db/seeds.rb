# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

image_url = [
"https://images.unsplash.com/photo-1560114928-40f1f1eb26a0?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80",
"https://images.pexels.com/photos/416160/pexels-photo-416160.jpeg?cs=srgb&dl=pexels-pixabay-416160.jpg&fm=jpg",
"https://images.pexels.com/photos/45201/kitty-cat-kitten-pet-45201.jpeg?cs=srgb&dl=pexels-pixabay-45201.jpg&fm=jpg",
"https://images.pexels.com/photos/290164/pexels-photo-290164.jpeg?cs=srgb&dl=pexels-pixabay-290164.jpg&fm=jpg",
"https://images.pexels.com/photos/1870376/pexels-photo-1870376.jpeg?cs=srgb&dl=pexels-larissa-barbosa-1870376.jpg&fm=jpg",
"https://images.pexels.com/photos/2061057/pexels-photo-2061057.jpeg?cs=srgb&dl=pexels-tranmautritam-2061057.jpg&fm=jpg",
"https://images.pexels.com/photos/127028/pexels-photo-127028.jpeg?cs=srgb&dl=pexels-vadim-b-127028.jpg&fm=jpg",
"https://images.pexels.com/photos/257532/pexels-photo-257532.jpeg?cs=srgb&dl=pexels-pixabay-257532.jpg&fm=jpg",
"https://images.pexels.com/photos/1056251/pexels-photo-1056251.jpeg?cs=srgb&dl=pexels-ihsan-aditya-1056251.jpg&fm=jpg",
"https://images.pexels.com/photos/127027/pexels-photo-127027.jpeg?cs=srgb&dl=pexels-vadim-b-127027.jpg&fm=jpg",
"https://images.pexels.com/photos/735423/pexels-photo-735423.jpeg?cs=srgb&dl=pexels-eftodii-aurelia-735423.jpg&fm=jpg",
"https://images.pexels.com/photos/1472999/pexels-photo-1472999.jpeg?cs=srgb&dl=pexels-alex-bargain-1472999.jpg&fm=jpg",
"https://images.pexels.com/photos/2194261/pexels-photo-2194261.jpeg?cs=srgb&dl=pexels-tranmautritam-2194261.jpg&fm=jpg"





]
prices = [9.99, 10.99, 11.99, 12.99, 13.99, 14.99, 15.99, 16.99, 17.99, 18.99, 19.99]


Item.all.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('items')
Cart.all.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('carts')
Order.all.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('orders')
User.all.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('users')
JoinOrderItem.all.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('join_order_items')
JoinCartItem.all.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('join_cart_items')
AdminUser.all.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('admin_users')


1.times do |i|
	u = User.new(password: "123456")
	  u.email = "user#{i+1}" + "@yopmail.com"
    u.save
  end
puts "Users created"

i=0
20.times do |i|
	item = Item.new(title: Faker::Creature::Cat.name, description: Faker::TvShows::GameOfThrones.quote, price: prices.sample, image_url: image_url[i])
		i += 1
    item.save
end
puts "Items created"

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

puts "Admin Created"

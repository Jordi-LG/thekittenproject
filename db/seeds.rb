# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

image_url = [
"https://active-storage-thp-cat.s3-us-west-1.amazonaws.com/photo+en+vente/399dced154b7acf2f50572240fd13.jpeg",
"https://active-storage-thp-cat.s3-us-west-1.amazonaws.com/photo+en+vente/arriv%C3%A9e-dun-chaton-%C3%A0-la-maison-768x547.jpeg",
"https://active-storage-thp-cat.s3-us-west-1.amazonaws.com/photo+en+vente/chat3.png",
"https://active-storage-thp-cat.s3-us-west-1.amazonaws.com/photo+en+vente/cat-3535404_960_720.jpg",
"https://active-storage-thp-cat.s3-us-west-1.amazonaws.com/photo+en+vente/cat-4142764_960_720.jpg",
"https://active-storage-thp-cat.s3-us-west-1.amazonaws.com/photo+en+vente/cat-4262702_960_720.jpg",
"https://active-storage-thp-cat.s3-us-west-1.amazonaws.com/photo+en+vente/cat-4282072_960_720.jpg",
"https://active-storage-thp-cat.s3-us-west-1.amazonaws.com/photo+en+vente/cat-baby-4208540_960_720.jpg",
"https://active-storage-thp-cat.s3-us-west-1.amazonaws.com/photo+en+vente/chat-chaton-animaux-domestiques.jpg",
"https://active-storage-thp-cat.s3-us-west-1.amazonaws.com/photo+en+vente/chaton-fb-59413483eb29f.jpg",
"https://active-storage-thp-cat.s3-us-west-1.amazonaws.com/photo+en+vente/chaton-jouets-fb-59a3ea83c1a7d.jpg",
"https://active-storage-thp-cat.s3-us-west-1.amazonaws.com/photo+en+vente/chaton-mignon-bebe-chat.jpg",
"https://active-storage-thp-cat.s3-us-west-1.amazonaws.com/photo+en+vente/cover-r4x3w1000-5c936acd26314-kitten-1517537-1920.jpg",
"https://active-storage-thp-cat.s3-us-west-1.amazonaws.com/photo+en+vente/cover-r4x3w1000-5c98c40f5bf3d-cat-3535399-1920.jpg",
"https://active-storage-thp-cat.s3-us-west-1.amazonaws.com/photo+en+vente/e51030a829fb07599a18d389f9e8-1583591.jpg!d.jpeg",
"https://active-storage-thp-cat.s3-us-west-1.amazonaws.com/photo+en+vente/europe_southfrance_s_dfrankreich_zuidfrankrijk_midi_m_diterran_e_languedocroussillon_languedoc-168794.jpg!d.jpeg",
"https://active-storage-thp-cat.s3-us-west-1.amazonaws.com/photo+en+vente/fotolia_161972413_m-1.jpg",
"https://active-storage-thp-cat.s3-us-west-1.amazonaws.com/photo+en+vente/kitten-3422770_960_720.jpg",
"https://active-storage-thp-cat.s3-us-west-1.amazonaws.com/photo+en+vente/petition-img-72960-fr.png.jpeg",
"https://active-storage-thp-cat.s3-us-west-1.amazonaws.com/photo+en+vente/sevrage-chaton-141629.jpg"
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

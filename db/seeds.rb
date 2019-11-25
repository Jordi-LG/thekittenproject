# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

image_url = [
"https://www.zooplus.fr/magazine/wp-content/uploads/2019/06/arrivée-dun-chaton-à-la-maison-768x547.jpeg",
"https://static.wamiz.fr/images/articles/facebook/article/chaton-fb-59413483eb29f.jpg",
"https://www.sciencesetavenir.fr/assets/img/2019/03/25/cover-r4x3w1000-5c98c40f5bf3d-cat-3535399-1920.jpg",
"https://www.mesopinions.com/public/img/petition/petition-img-72960-fr.png",
"https://www.sciencesetavenir.fr/assets/img/2019/03/21/cover-r4x3w1000-5c936acd26314-kitten-1517537-1920.jpg",
"https://fac.img.pmdstatic.net/fit/http.3A.2F.2Fprd2-bone-image.2Es3-website-eu-west-1.2Eamazonaws.2Ecom.2Ffac.2F2018.2F11.2F20.2F140ace02-909a-4c82-8085-e0a5f769277e.2Ejpeg/748x372/quality/90/crop-from/center/focus-point/704%2C340/4-questions-a-se-poser-avant-d-adopter-un-chaton.jpeg",
"https://jardinage.lemonde.fr/images/dossiers/2018-10/sevrage-chaton-141629.jpg",
"https://static.wamiz.fr/images/articles/facebook/article/chaton-jouets-fb-59a3ea83c1a7d.jpg",
"https://www.wikichat.fr/wp-content/uploads/sites/2/fotolia_161972413_m-1.jpg",
"https://img.bfmtv.com/c/1000/600/39d/399dced154b7acf2f50572240fd13.jpeg",
"https://cdn.pixabay.com/photo/2018/07/13/10/20/cat-3535404_960_720.jpg",
"https://cdn.pixabay.com/photo/2019/05/16/22/48/cat-baby-4208540_960_720.jpg",
"https://c.pxhere.com/photos/03/d3/europe_southfrance_s_dfrankreich_zuidfrankrijk_midi_m_diterran_e_languedocroussillon_languedoc-168794.jpg!d",
"https://cdn.pixabay.com/photo/2019/04/20/21/20/cat-4142764_960_720.jpg",
"https://www.publicdomainpictures.net/pictures/230000/velka/chat-chaton-animaux-domestiques.jpg",
"https://cdn.pixabay.com/photo/2019/06/09/19/13/cat-4262702_960_720.jpg",
"https://c.pxhere.com/images/2c/2c/e51030a829fb07599a18d389f9e8-1583591.jpg!d",
"https://www.publicdomainpictures.net/pictures/160000/velka/chaton-mignon-bebe-chat.jpg",
"https://cdn.pixabay.com/photo/2018/05/22/22/55/kitten-3422770_960_720.jpg",
"https://cdn.pixabay.com/photo/2019/06/18/11/03/cat-4282072_960_720.jpg",
"https://cdn.pixabay.com/photo/2018/07/13/10/17/cat-3535399_960_720.jpg"
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


5.times do |i|
	u = User.new(password: "123456")
	  u.email = "user#{i+1}" + "@yopmail.com"
    u.save
  end
puts "Users created"


20.times do |i|
	item = Item.new(title: Faker::Creature::Cat.name, description: Faker::TvShows::GameOfThrones.quote, price: prices.sample, image_url: image_url[i])
		i += 1
    item.save
end
puts "Items created"



1.times do
	c = Cart.create(user_id: rand(1..5))
end
puts "Cart created"


1.times do |i|
	Order.create(user_id: 1)
end
puts "Order created"

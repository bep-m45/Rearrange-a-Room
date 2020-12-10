# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
   email: 'admin@admin.com',
   password: 'adminadmin'
)

room_layoutes = RoomLayout.create([{:layout_name=>"1R"}, {:layout_name=>"1K"},{:layout_name=>"1DK"}, {:layout_name=>"1LDK"},{:layout_name=>"2R"}, {:layout_name=>"2K"},{:layout_name=>"2DK"},{:layout_name=>"2LDK"},{:layout_name=>"3K"},{:layout_name=>"3K"},{:layout_name=>"3DK"},{:layout_name=>"3LDK"},{:layout_name=>"その他"}])
room_genres = RoomGenre.create([{:genre_name=>"リビング"}, {:genre_name=>"私室"}, {:genre_name=>"寝室"}, {:genre_name=>"仕事部屋"}, {:genre_name=>"子ども部屋"},{:genre_name=>"キッチン"}, {:genre_name=>"寝室"}, {:genre_name=>"洗面所・浴室"},{:genre_name=>"トイレ"}, {:genre_name=>"ベランダ・テラス"}, {:genre_name=>"その他"}])
room_images = RoomImage.create([{:image_name=>"ナチュラル"}, {:image_name=>"和風"}, {:image_name=>"シック"},{:image_name=>"フェミニン"},{:image_name=>"モダン"}, {:image_name=>"カフェ"}, {:image_name=>"アメリカン"}, {:image_name=>"西海岸"}, {:image_name=>"アジアン"}, {:image_name=>"ヨーロピアン"}, {:image_name=>"その他"}])

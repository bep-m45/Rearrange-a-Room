# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
category = Category.create(:category_name=>"カテゴリー")

category_layouts = category.children.create(:category_name=>"間取り")
category_rooms = category.children.create(:category_name=>"部屋の種類")
category_images = category.children.create(:category_name=>"イメージ")
category_layouts.children.create([{:room_layout_name=>"1R"}, {:room_layout_name=>"1K"},{:room_layout_name=>"1DK"}, {:room_layout_name=>"1LDK"}])
category_rooms.children.create([{:category_name=>"リビング"}, {:room_genre_name=>"私室"}, {:room_genre_name=>"仕事部屋"},{:room_genre_name=>"キッチン"}, {:room_genre_name=>"洗面所・浴室"},{:room_genre_name=>"トイレ"}, {:room_genre_name=>"ベランダ・テラス"}, {:room_genre_name=>"その他"}])
category_images.children.create([{:room_image_name=>"ナチュラル"}, {:room_image_name=>"シック"},{:room_image_name=>"フェミニン"},{:room_image_name=>"カフェ"}, {:room_image_name=>"アメリカン"}, {:room_image_name=>"西海岸"}, {:room_image_name=>"アジアン"}])
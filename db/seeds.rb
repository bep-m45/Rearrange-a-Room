# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
layout　＝ Category .create(name: "間取り")
layout_1 = layout.children.create(name: "1R")
layout_2 = layaut.children.create(name: "1K")
layout_3 = layaut.children.create(name: "1DK")
layout_4 = layout.children.create(name: "1LDK")


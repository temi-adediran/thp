# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
zones = ["A5", "A2", "A3", "A4", "A1"]
zones.each do |name|
  Zone.create(name: name)
end

users = [
  ["Temitope", "Adediran", "password"],
  ["Emmanuel", "Charis Adediran", "password"],
  ["Geri", "Roberts", "password"],
  ["Admin", "Sample", "password"],
  ["Admin2", "Sample", "password"],
]

users.each do |first_name, last_name, password, zone|
  User.create(
    first_name: first_name,
    last_name: last_name,
    password: password,
    zone: Zone.first
  )
end

chapters = ["The Favoured Haven", "The Rich Haven", "The Treasured Haven"]
chapters.each do |name|
  Chapter.create(name: name)
end

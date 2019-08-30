# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 50.times do
#   password = Faker::Internet::password(min_length: 8)
#     User.create(
#       name: Faker::Name.first_name,
#       email: Faker::Internet.email,
#       password: password,
#       password_confirmation: password
#       )
# end

# user_ids = User.ids
# 100.times do
#   Article.create(
#     title: Faker::Book.title,
#     content: Faker::Lorem.paragraphs,
#     user_id: user_ids.sample
#   )
# end

# article_ids = Article.ids
# 200.times do
#   Comment.create(
#     content: Faker::Lorem.sentence,
#     user_id: user_ids.sample,
#     article_id: article_ids.sample
#   )
# end
# image_path = Dir.glob("/Users/shimoch/Documents/写真素材/通り・町並み等(おすすめ)/*")
# Article.all.each do |article|
#   article.image = File.open(image_path.sample)
#   article.save
# end
ano_path = Dir.glob("/Users/shimoch/Desktop/あのちゃん/*")
User.all.each do |user|
  user.ano = File.open(ano_path.sample)
  user.save
end

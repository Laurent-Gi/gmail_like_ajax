# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Email.destroy_all

12.times do
  object = Faker::TvShows::Suits.quote
  body = Faker::Lorem.paragraph(sentence_count: 40)
  read = false
  Email.create(object: object, body: body, read: read)

  # Remplaçable par la nouvelle fonction
  # Email.create_fake

end
puts("Seeds: #{Email.all.size} emails created")
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

User.destroy_all

20.times do
  User.create( nickname: Faker::Name.name,
               email: Faker::Internet.email,
               password: Faker::Internet.password(8))
end

User.all.each do |user|
  (rand(1..4)).times do
    user.posts.create(
      title: Faker::Lorem.sentence(3),
      body: Faker::Lorem.paragraph,
      published_at: Faker::Date.between(5.years.ago, Date.today).strftime('%d.%m.%Y %H:%m').to_date
    )

    (30-rand(1..10)).times do
      user.comments.create(
        body: Faker::Lorem.sentence,
        post_id: user.posts.last.id
      )
    end
  end
end

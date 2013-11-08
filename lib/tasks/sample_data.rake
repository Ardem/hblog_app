namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_microposts
  end
end

def make_users
  admin = User.create!(name:     "Example User",
                       email:    "user@example.com",
                       password: "123123123",
                       password_confirmation: "123123123",
                       birthday: "1990-11-06",
                       admin: true)
  99.times do |n|
    name  = Faker::Name.name
    email = "user-#{n+1}@example.com"
    password  = "password"
    User.create!(name:     name,
                 email:    email,
                 password: password,
                 birthday: "1992-10-07",
                 password_confirmation: password)
  end
end

def make_microposts
  users = User.all(limit: 6)
  50.times do
    content = Faker::Lorem.sentence(5)
    users.each { |user| user.microposts.create!(content: content) }
  end
end

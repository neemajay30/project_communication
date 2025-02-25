require 'faker'

User.destroy_all
Comment.destroy_all
Project.destroy_all

users = []
users << User.create!(
  email: 'testuser@gmail.com',
  password: "Test@123"
)

5.times do
  users << User.create!(
    email: Faker::Internet.unique.email,
    password: "Test@123"
  )
end

projects = []
10.times do
  projects << Project.create!(
    name: Faker::Company.unique.name,
    status: Project.statuses.keys.shuffle.last,
    description: Faker::Lorem.paragraph(sentence_count: 6),
    user: users.sample,
  )
end

50.times do
  Comment.create!(
    content: Faker::Lorem.paragraph(sentence_count: 3),
    user: users.sample,
    project: projects.sample
  )
end

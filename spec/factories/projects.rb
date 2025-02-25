FactoryBot.define do
  factory :project do
    name { Faker::Company.unique.name }
    description { Faker::Lorem.paragraph(sentence_count: 6) }
    status { "draft" }
    association :user
  end
end

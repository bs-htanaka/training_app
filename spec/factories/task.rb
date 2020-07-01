FactoryBot.define do
  
  factory :user, class: User do
    sequence(:id) { |n| n }
    sequence(:name) { |n| "name_#{n}" }
    email { Faker::Internet.free_email }
    sequence(:password_digest) { |n| "pass_#{n}" }
  end

  factory :task, class: Task do
    title { "task" }
    description {"taskの内容"}
    sequence(:limit_day) { |n| (Date + n.days).to_s }
    status { "未着手" }
    user
  end
end
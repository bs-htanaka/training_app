FactoryBot.define do
  factory :task do
    sequence(:id, 5) { |n| "#{n}" }
    title {'テストをかく'}
    description {'テスト実行'}
    created_at {Time.now}
    updated_at {Time.now}
  end
end
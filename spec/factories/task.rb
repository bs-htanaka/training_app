FactoryBot.define do
  factory :task do
    sequence(:id) { |n| n }
    title {'テストをかく'}
    description {'テスト実行'}
    sequence(:limit_day) { |n| (Time.zone.today + n.days).to_s }
  end
end
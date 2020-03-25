FactoryBot.define do
  factory :task do
    title {'テストをかく'}
    description {'テスト実行'}
    limit_day {Time.now}
    status {"未着手"}
  end
end
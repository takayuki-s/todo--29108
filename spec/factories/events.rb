FactoryBot.define do
  factory :event do
    association :user
    title               {"test"}
    detail              {"testtext"}
    event_date          { "2020-12-29" }
    event_time          { "21:47:00" }
    category_id         { 1 }
  end
end

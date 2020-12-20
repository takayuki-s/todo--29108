FactoryBot.define do
  factory :user do
    nick_name              {"test"}
    email                 {"test@example"}
    password              {"a1a1a1"}
    password_confirmation {password}
  end
end
FactoryBot.define do
  factory :user do
    nickname                  {"ゴンゾウ"}
    email                     {Faker::Internet.free_email}
    password                  {"a1a1a1a1"}
    password_confirmation     { password }
    family_name               {"山田"}
    first_name                {"権蔵"}
    family_name_kana          {"ヤマダ"}
    first_name_kana           {"ゴンゾウ"}
    birth_day                 {2000_1_1}
  end
end

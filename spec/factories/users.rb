FactoryBot.define do
  factory :user do
    id                    { "1" }
    created_at            { "20190620" }
    updated_at            { "20190622" }
    nickname              { "のっぶ" }
    family_name             { "小林" }
    first_name            { "東京" }
    family_kana        { "コバヤシ" }
    first_kana       { "トウキョウ" }
    birth_day         { "23" }
    birth_month         { "6" }
    birth_year         { "1989" }
    email                 { "aaa@gmail.com" }
    password              { "00000000" }
    password_confirmation { "00000000" }
  end
end
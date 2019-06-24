FactoryBot.define do
  factory :item do
    name          { "item" }
    description   { "オススメ" }
    first_category_id   { 1 }
    second_category_id   { 2 }
    third_category_id   { 3 }
    brand_id         { "UNIQLO" }
    status        { 1 }
    price           { 100 }
    condition_id     { 1 }
    delivery_burden_id      { 1 }
    delivery_way_id      { 1 }
    delivery_days_id      { 1 }
    prefecture_id    { "東京都" }
    user_id       { 1 }
    size_id          { 1 }
  end
end
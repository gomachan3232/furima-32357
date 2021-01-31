FactoryBot.define do
  factory :item do
    name            { 'テスト' }
    info            { 'テスト' }
    category_id     { 2 }
    condition_id    { 2 }
    shipping_fee_id { 2 }
    prefecture_id   { 2 }
    send_day_id     { 2 }
    price           { 300 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/comment.png'), filename: 'comment.png')
    end
  end
end

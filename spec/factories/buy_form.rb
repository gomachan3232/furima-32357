FactoryBot.define do
  factory :buy_form do
    post_code      { "123-4567" }
    prefecture_id  { 2 }
    city           { "テスト市テスト区"}
    address        { "テスト１−１"}
    phone_number   { "09012345678" }
  end

end

FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    first_name            { 'テスト' }
    last_name             { 'テスト' }
    first_name_kana       { 'テスト' }
    last_name_kana        { 'テスト' }
    birthday              { '2021-01-01' }
  end
end

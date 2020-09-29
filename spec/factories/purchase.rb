FactoryBot.define do
  factory :purchase do

    association :user
    association :item
    
    token                  { "tok_555ce8g624a03d4f89e74125161h" }
    postal_code            { "123-4567" }
    prefecture_id          { 2 }
    city                   { "新宿区" }
    addresses              { "歌舞伎町" }
    building               { "歌舞伎ビル" }
    phone_number           { "09012345678" }

  end
end

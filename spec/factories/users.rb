FactoryBot.define do
  factory :user do
    nickname { 'test' }
    email { 'test@test.com' }
    password { 'mmm123' }
    password_confirmation { 'mmm123' }
    last_name { '山田' }
    first_name { '太郎' }
    last_name_kana { 'ヤマダ' }
    first_name_kana { 'タロウ' }
    birthday { '2020-01-01' }
  end
end

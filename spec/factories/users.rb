FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    nickname { Faker::Name.name }
    email { Faker::Internet.email }
    password { '111aaa' }
    password_confirmation { password }
    firstname { person.first.kanji }
    lastname { person.last.kanji }
    firstname_furigana { person.first.katakana }
    lastname_furigana { person.last.katakana }
    birthday { Faker::Date.backward }
  end
end

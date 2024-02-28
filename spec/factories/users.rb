FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    nickname { Faker::Name.initials }
    email { Faker::Internet.email }
    password { 'a1' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name { person.last.kanji }
    first_name { person.first.kanji }
    last_name_katakana { person.last.katakana }
    first_name_katakana { person.first.katakana }
    date_of_birth { Faker::Date.birthday }
  end
end

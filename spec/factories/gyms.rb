FactoryBot.define do
  factory :gym do
    name { "MyString" }
    established { "2021-08-17" }
    location { build(:location) }
  end
end

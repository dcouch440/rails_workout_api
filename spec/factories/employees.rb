FactoryBot.define do
  factory :employee do
    name { "MyString" }
    hired { "2021-08-17" }
    employment_active { true }
    gym { build(:gym) }
    location { build(:location) }
  end
end

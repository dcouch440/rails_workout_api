FactoryBot.define do
  factory :member do
    name { "MyString" }
    membership_active { true }
    gym { build(:gym) }
    location { build(:location) }
  end
end

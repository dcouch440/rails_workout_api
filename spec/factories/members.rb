FactoryBot.define do
  factory :member do
    name { "MyString" }
    signed_up { "2021-08-17" }
    membership_active { true }
    gym { build(:gym) }
    location { build(:location) }
  end
end

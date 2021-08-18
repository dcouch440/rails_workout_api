FactoryBot.define do
  factory :member do
    name { "MyString" }
    membership_active { 'active' }
    gym { build(:gym) }
    location { build(:location) }
  end
end

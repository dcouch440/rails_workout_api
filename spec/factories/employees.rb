FactoryBot.define do
  factory :employee do
    name { "Bob Ross" }
    hired { "2021-08-17" }
    employment_active { 'active' }
    gym { build(:gym) }
    location { build(:location) }
  end
end

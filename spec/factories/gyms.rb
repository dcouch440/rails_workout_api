FactoryBot.define do
  factory :gym do
    name { "Golds Gym" }
    established { "1965-08-25" }
    location { build(:location) }
  end
end

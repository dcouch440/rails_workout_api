FactoryBot.define do
  factory :shift do
    check_in { "2021-08-17 16:04:13" }
    check_out { "2021-08-17 16:04:13" }
    employee { build(:employee) }
  end
end

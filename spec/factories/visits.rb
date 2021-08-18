FactoryBot.define do
  factory :visit do
    check_in { "2021-08-17 16:03:19" }
    check_out { nil }
    member { build(:member) }
  end
end

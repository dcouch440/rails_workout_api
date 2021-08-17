FactoryBot.define do
  factory :location do
    street_address { "123 Rodeo Drive" }
    state_province { "CA" }
    city { "Beverly Hills" }
    postal_code { 90212 }
  end
end

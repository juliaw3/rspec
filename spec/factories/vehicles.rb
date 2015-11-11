FactoryGirl.define do
  factory :vehicle do
    model   { Faker::Vehicle.model }
    make    { Faker::Vehicle.make  }
    year    { Faker::Vehicle.year  }
    style   'Car'
  end
end
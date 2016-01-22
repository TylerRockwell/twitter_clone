FactoryGirl.define do
  factory :post do
    user
    content Faker::Company.buzzword
  end

end

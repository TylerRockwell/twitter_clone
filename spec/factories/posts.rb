FactoryGirl.define do
  factory :post do
    user_id 1
    content Faker::Company.buzzword
  end

end

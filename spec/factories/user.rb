FactoryGirl.define do
  factory :user, class: 'User' do
    email                 'user@example.com'
    password              'password'
    password_confirmation 'password'
    bio                   'Hello'
    username              'user'
  end
end

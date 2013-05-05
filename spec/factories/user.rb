FactoryGirl.define do
  
  factory :user do
    email                 "user@example.com"
    password              "p@ssw0rd"
    password_confirmation "p@ssw0rd"
  end

end
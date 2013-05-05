FactoryGirl.define do
  
  factory :folder do
    name        "My first album"
    association :user, factory: :user
  end

end
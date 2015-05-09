FactoryGirl.define do
  factory :message do
    content "MyString"
    association :user
  end

end

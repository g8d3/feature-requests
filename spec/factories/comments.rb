FactoryGirl.define do
  factory :comment do
    commentable_type "MyString"
    commentable nil
    user nil
    text "MyText"
  end
end

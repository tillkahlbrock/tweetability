FactoryGirl.define do
  factory :pattern do
    title 'some title'
    pattern 'some pattern'
  end
  factory :tweet do
    created '2012-12-12 12:12:12'
    text 'some text'
  end
end
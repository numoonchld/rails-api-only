FactoryBot.define do
  factory :article do
    sequence(:title) { |n| "Sample Article #{n}" }
    content { "MyText" }
    sequence(:slug)  { |n| "sample-article-#{n}" }
  end
end

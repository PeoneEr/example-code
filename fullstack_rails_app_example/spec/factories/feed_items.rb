# frozen_string_literal: true

FactoryBot.define do
  factory :feed_item do
    title { 'MyString' }
    company { 'MyString' }
    location { 'MyString' }
    description { 'MyText' }
    salary { 'MyString' }

    association :feed
  end
end

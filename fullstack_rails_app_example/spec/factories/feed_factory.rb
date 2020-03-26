# frozen_string_literal: true

FactoryBot.define do
  factory :feed do
    title { 'feed' }
    search_query { 'rails' }
    search_region { 'moscow' }

    association :user
  end
end
